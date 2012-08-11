package org.ughub

class Member {
	String firstName
	String lastName
	String userName
	static belongsTo = Group
	static hasMany = [groups:Group]
	static constraints = {
	}
}
