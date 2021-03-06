package org.ughub

class PostComment {
	
	String comment
	//Post referencedPost
	User author
	Date commentDate = new Date()
	
	static belongsTo = [referencedPost: Post]
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
