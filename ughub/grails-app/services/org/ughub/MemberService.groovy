package org.ughub

class MemberService {

	def springSecurityService

    Member getCurrentMember() {
	   	def user = springSecurityService.currentUser
	   	log.debug "current user: $user"
   		log.debug "looking up member"
   		def member = Member.findByUser(user)
   		log.debug member
   		member
    }

    Member getMemberById(int memberId) {

      Member.findById(memberId)
    }
}
