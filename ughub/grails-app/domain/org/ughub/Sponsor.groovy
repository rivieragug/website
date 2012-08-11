package org.ughub

import java.util.Set;

class Sponsor {
	Set tags
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
