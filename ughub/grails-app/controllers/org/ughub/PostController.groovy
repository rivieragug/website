package org.ughub

class PostController {
    def scaffold = true 
	
	def memberService
	
	def create() {
		render(view:'create',model:params)
	}
	
	def save() {
		println params
		
		Post post = new Post()
		String title = params['title']
		post.setTitle(title)
		
		String content = params['content']
		post.setPostContent(content)
		
		Blog refBlog = Blog.findById(params['blog.id'])
		post.setReferenceBlog(refBlog)
		post.setAuthor(memberService.currentMember)
		post.setPostDate(new Date())
		post.setLastUpdateDate(new Date())
		
		if (!post.save()) {
			flash.put('title', title)
			flash.put('content', content)
			flash.message='Failed to create post'
			redirect(action : 'create',params:["blog.id":params['blog.id']])
		} else {
			redirect(controller:'post', action:'show')
		}
	}
	
	def update() {
		
	}
	
	
}
