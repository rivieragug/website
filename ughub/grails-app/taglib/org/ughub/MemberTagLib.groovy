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
		def propVal = member?."$attrs.prop"
		out << propVal
	}
}
