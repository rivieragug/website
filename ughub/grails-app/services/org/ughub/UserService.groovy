package org.ughub

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.core.authority.AuthorityUtils
import org.springframework.security.core.authority.GrantedAuthorityImpl

class UserService {

	def springSecurityService

    User getCurrentUser() {
	   	def user = springSecurityService.currentUser
	   	log.debug "current user: $user"
   		user
    }

    User getUserById(int userId) {
      User.findById(userId)
    }
	
	def forceUserLogin(String name) {
		springSecurityService.reauthenticate name
	}
	
	def forceUserLoginWithRoles(User u, authorities) {
		def grantedRoles = []
		authorities.each(){ authority -> 
			def role = new GrantedAuthorityImpl(authority.authority)
			grantedRoles << role
		}
		
		def auth = new UsernamePasswordAuthenticationToken(u, null, grantedRoles);
		
		SecurityContextHolder.getContext().setAuthentication(auth);
	}
}
