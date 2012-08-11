package org.ughub

class Sponsor {
	String companyName
	String description
	URL website
	URL logo
	static hasMany = [groups: Group] //TODO add Event
	static belongsTo = Group
	
    static constraints = {
    }
    String toString() { companyName }
}
