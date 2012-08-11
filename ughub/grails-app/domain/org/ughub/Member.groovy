package org.ughub

class Member {
	String firstName
	String lastName
	User   user
	static belongsTo = Group
	static hasMany = [groups:Group]
	static constraints = {
	}
    String toString() { "$firstName $lastName" }

}
