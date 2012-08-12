package org.ughub

import grails.plugins.springsecurity.SpringSecurityService;

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.GrantedAuthorityImpl

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.openid.OpenIdAuthenticationFailureHandler as OIAFH
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder


class UserController {
    
	def springSecurityService
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
    log.debug params
    
    def u 
    // Existing user
    if (params.id) {
      u = User.findById(params.id)
      u.properties = params
      u.save()
      redirect(action:'show')
    } 
    // Creatign a new one
    else {
      
      u = new User(params)
      
      def username = params['username']
      if (User.findByUsername(username) == null) {
        //create
        u.enabled = true
        //openid
        def openId = session[OIAFH.LAST_OPENID_USERNAME]
		def isGoogleAuth = flash.get('GOOGLE_AUTH')
		
		if (!isGoogleAuth && openId == null){
			if (!u.password){
				flash.put('user', u)
				flash.message='Empty password not allowed in password based user'
				redirect(action : 'create')
				return
			}
		}
		
		if (openId != null){
          u.addToOpenIds(url: openId)
          u.password = ''
		  u.passwordExpired = true
        }
		
		if (isGoogleAuth){
			u.password = ''
			u.passwordExpired = true
		}
        
		
        u.save(failOnError : true)
        
        //assign default role
        def authority = Authority.findByAuthority('ROLE_BASE')
        new UserAuthority(user : u, authority : authority).save(failOnError : true)
        
		//force authentication
		userService.forceUserLoginWithRoles(u,[authority])
		
        redirect(controller : 'home') 
      } else {
        flash.put('user', u)
        flash.message='Username ' + username + ' already present'
        redirect(action : 'create')
      }
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
