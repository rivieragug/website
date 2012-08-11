package org.ughub

class Group {
	String name
	String description
	String logoPath
	static hasMany = [members: Member, events: Event]
	static constraints = {
	}

	static mapping = {
		name()
        collection "ugroup"
    }
}
