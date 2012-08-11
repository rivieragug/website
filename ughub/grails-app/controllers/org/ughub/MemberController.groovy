package org.ughub

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.core.authority.AuthorityUtils;

class MemberController {
    def scaffold = true
	

    def index() {

    }

	/**
	 * Saves a and a profile if that username does not exist.
	 * @return
	 */
	def save() {
		def username = params['username']
		def us = new User(params)
		def m = new Member(params)
		m.user = us
		def u = User.findByUsername(username)
		if (u == null){
			//create
			us.enabled = true
			us.save(failOnError : true)
			m.save(failOnError : true)
			//assign default role
			def authority = Authority.findByAuthority('ROLE_BASE')
			new UserAuthority(user : us, authority : authority).save(failOnError : true)
			
			redirect(controller : 'home')	
		}else {
			flash.put('member', m)
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
}
