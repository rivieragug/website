package org.ughub

class Group {
	String name
	String description
	byte[] minilogo
	static hasMany = [members: Member, events: Event]
	static constraints = {
	}

	static mapping = {
        collection "ugroup"
    }
}
