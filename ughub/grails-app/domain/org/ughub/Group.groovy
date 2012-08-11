package org.ughub

class Group {
	String name
	String description
	String logoPath
	static hasMany = [members: Member, events: Event, sponsors: Sponsor]
	static constraints = {
		name()		
	}

	static mapping = {
		collection "ugroup"
		//sponsors(nullable:true)
    }

    String toString() { name }
	
}
