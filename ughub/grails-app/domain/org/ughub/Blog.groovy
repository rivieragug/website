package org.ughub

class Blog {
	
	String name
	String description

	static hasMany = [posts: Post]
    static constraints = {
		name()
		description(nullable:true)
    }
    
    String toString() { name }
}
