package org.ughub

import java.util.Set;

class Post {
	Set tags
    String title
    String postContent
    Member author
	Blog referenceBlog
	Date postDate = new Date()
	Date lastUpdateDate = new Date()
	
		
    static hasMany = [comments: PostComment]

    static constraints = {
        title()
		author()
		postContent()
    	referenceBlog(nullable:true)
		postDate()
		lastUpdateDate()
		comments()
    }

    String toString() { title }
}
