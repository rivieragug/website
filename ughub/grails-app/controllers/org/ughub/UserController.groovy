package org.ughub

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.core.authority.AuthorityUtils;

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.openid.OpenIdAuthenticationFailureHandler as OIAFH

class UserController {
    def scaffold = true
		def userService

    def index() {

    }

  def show() {

		def user
  	// Looking at someone's profile
  	if (params.id) {
  		user = userService.getUserById(params.id as Integer)
  	}
  	// My current user's profile
  	else {
			user = userService.currentUser
  	}

		// Not a logged in user? redirect to users list
  	if ( !user ) {
  		redirect(action:"list")
  	}
  	[userInstance: user]
  }

	/**
	 * Saves a and a profile if that username does not exist.
	 * @return
	 */
	def save() {
		def username = params['username']
		def us = new User(params)
		def m = new User(params)
		m.user = us
		def u = User.findByUsername(username)
		if (u == null){
			//create
			us.enabled = true
			//openid
			String openId = session[OIAFH.LAST_OPENID_USERNAME]
			if (openId != null){
				us.addToOpenIds(url: openId)
				us.password = null
			}
			
			us.save(failOnError : true)
			m.save(failOnError : true)
			
			//assign default role
			def authority = Authority.findByAuthority('ROLE_BASE')
			new UserAuthority(user : us, authority : authority).save(failOnError : true)
			
			redirect(controller : 'home')	
		}else {
			flash.put('user', m)
			flash.message='Username ' + username + ' already present'
			redirect(action : 'create')
		}
		
	}
	
	/**
	 * 
	 * @return
	 */
	def create() {
		render(view : 'create')
	}
	
	/**
	 * Prepares the content for the creation view
	 */
	def createAccountOpenId = { OpenIdRegisterCommand command ->
		
		def uname = session[OIAFH.LAST_OPENID_USERNAME]
		render(view : 'create', model : [username : uname , openid : true, controlsDisabled:'disabled'])
	}
	
	
}
