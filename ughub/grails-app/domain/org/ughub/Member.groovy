package org.ughub

class Member {
	String firstName
	String lastName
	static hasOne = [user: User]
	static belongsTo = Group
	static hasMany = [groups:Group]
	static constraints = {
	}
}
