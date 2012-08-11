package org.ughub

import java.util.Set;

class Blog {
	Set tags
	String name
	String description

	static hasMany = [posts: Post]
    static constraints = {
		name()
		description(nullable:true)
    }
    
    String toString() { name }
}
