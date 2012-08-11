package org.ughub

class Post {
        
    String title
    String postContent
    Member author
    Group groupOwner
	
    static hasMany = [comments: PostComment]

    static constraints = {
        title()
    	groupOwner(nullable:true)
    }

    String toString() { title }
}
