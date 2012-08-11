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

			def member = memberService.currentMember
			if (member && attrs?.memberId == member.id) {
				out << body()
			}

	}
}
