package org.ughub

class Group {
	String name
	String description
	String logoPath
	static hasMany = [members: Member, events: Event, sponsors: Sponsor]
	static constraints = {
	}

	static mapping = {
		name()
        collection "ugroup"
		//sponsors(nullable:true)
    }
	
}
