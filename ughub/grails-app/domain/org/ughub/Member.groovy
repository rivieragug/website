package org.ughub

import java.util.Set;

class Member {
	Set tags
	String firstName
	String lastName
	User   user
	static belongsTo = Group
	static hasMany = [groups:Group]
	static constraints = {
	}
    String toString() { "$firstName $lastName" }

}
