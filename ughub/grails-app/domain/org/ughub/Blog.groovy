package org.ughub

import java.util.Set;

class Blog {
	Set tags
	String name
	String description
	Group group
	Date creationDate = new Date()
	Date updateDate = new Date()

	static hasMany = [posts: Post]
    static constraints = {
		name(unique: true, blank: false)
		description(nullable: true)
		group(nullable: false)
		creationDate()
    }
    
    String toString() { name }
}
