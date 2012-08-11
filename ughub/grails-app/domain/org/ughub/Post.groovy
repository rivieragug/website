package org.ughub

import java.util.Set;

class Post {
	Set tags
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
