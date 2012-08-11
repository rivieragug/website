package org.ughub

class Sponsor {
	String companyName
	String description
	URL website
	Image minilogo
	static hasMany = [groups: Group] //TODO add Event
	static belongsTo = Group
	
    static constraints = {
	  companyName()
	  description()
	  website()
	  minilogo(nullable:true)	
    }

    String toString() { companyName }
}
