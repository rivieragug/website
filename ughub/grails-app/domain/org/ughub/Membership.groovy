package org.ughub

class Membership {

	User  user
	Group group

	static belongsTo = [Group, User]

    static constraints = {
    }
}
