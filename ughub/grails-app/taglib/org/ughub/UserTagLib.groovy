package org.ughub

class UserTagLib {
	static namespace = "ug"

	def userService

	/**
     * Displays a current user property
	 *
	 *  @attr prop REQUIRED property to display 
     */
	def currentUser = { attrs ->
		def user = userService.currentUser
		
		def propVal = (user."${attrs.prop}")?.toString()

		out << propVal
	}

	def isProfileOwner = { attrs, body ->

			if (isOwner(attrs)) {
				out << body()
			}
	}
	def isNotProfileOwner = { attrs, body ->
			if (!isOwner(attrs)) {
				out << body()
			}
	}

	private def isOwner(attrs) {
			def user = userService.currentUser
			(user && attrs?.userId == user.id) 
	}
}
