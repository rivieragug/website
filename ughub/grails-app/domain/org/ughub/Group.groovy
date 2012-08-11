package org.ughub

class Group {
	String name
	String description
	Image minilogo
	
	static hasMany = [members: Member, events: Event, sponsors: Sponsor]
	static constraints = {
		name()		
	}
    String toString() {name}
	static mapping = {
		collection "ugroup"
		//sponsors(nullable:true)
    }
	
}
