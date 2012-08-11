package org.ughub

class Member {
	String firstName
	String lastName
	String userName
	static hasMany = [groups:Group]
	static constraints = {
	}
}
