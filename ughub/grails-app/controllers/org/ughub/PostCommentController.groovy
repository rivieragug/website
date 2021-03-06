package org.ughub

class PostCommentController {
    def scaffold = true
	def userService
	
	def create() {
		render(view:'create',model:params)
	}
	
	def save() {
		PostComment comment = new PostComment()
		String commentContent = params['comment']
		comment.setComment(commentContent)
		Post refPost = Post.findById(params['post.id'])
		comment.setReferencedPost(refPost)
		comment.setAuthor(userService.currentUser)
		comment.setCommentDate(new Date()) 
		if (!comment.save()) {
    		flash.put('comment', commentContent)
	    	flash.message='Failed to create comment'
		    redirect(action : 'create',params:["post.id":params['post.id']])
		} else {
			redirect(controller:'post', action:'show', id:params['post.id'])
		}
	}
	
	
}
