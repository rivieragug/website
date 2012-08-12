package org.ughub

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
}
