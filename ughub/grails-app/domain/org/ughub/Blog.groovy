package org.ughub

import java.util.Set;

class Blog {
	Set tags
	String name
	String description
	Group group
	Date creationDate = new Date()

	static hasMany = [posts: Post]
    static constraints = {
		name()
		description(nullable:true)
		group()
		creationDate()
    }
    
    String toString() { name }
}
