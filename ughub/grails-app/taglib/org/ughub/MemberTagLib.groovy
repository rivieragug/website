package org.ughub

class MemberTagLib {
	static namespace = "ug"

	def memberService

	/**
     * Displays a current member property
	 *
	 *  @attr prop REQUIRED property to display 
     */
	def currentMember = { attrs ->
		def member = memberService.currentMember

		def propVal = (member."${attrs.prop}")?.toString()

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
			def member = memberService.currentMember
			(member && attrs?.memberId == member.id) 
	}
}
