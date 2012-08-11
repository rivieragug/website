package org.ughub

import java.util.Set;

class Group {
	Set tags
	String name
	String description
	Image minilogo
	
	static hasMany = [users: User, events: Event, sponsors: Sponsor]
	static constraints = {
		name()		
	}
    String toString() {name}
	static mapping = {
		collection "ugroup"
		//sponsors(nullable:true)
    }
	
}
