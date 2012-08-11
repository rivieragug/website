package org.ughub

class PostComment {
	
	String comment
	Post referencedPost
	Member author
	Date commentDate = new Date()
	
    static constraints = {
		referencedPost()
		author()
		comment()
		commentDate()
    }
	
	String toString() {
		comment
	}

}
