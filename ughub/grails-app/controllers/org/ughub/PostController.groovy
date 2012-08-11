package org.ughub

class PostController {
    def scaffold = true 
	
	def memberService
	
	def create() {
		render(view:'create',model:params)
	}

	def update() {
		def postId = params['id']
		Post p = Post.findById(postId)
		println ".... $p ..."
		if (p!= null) {		
			render(view:'update',model:[postInstance:p,id:postId])
		} else {
			redirect(controller:'post', action:'show')
		}
	}

	def save() {
		
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
	
	def edit() {
		def postId = params['id']
		Post post = Post.findById(postId)

		if (post.author != memberService.currentMember) {
			flash.message='Only author can update his post'
			redirect(controller:'post', action:'show')
		} else {
			String title = params['title']
			post.setTitle(title)
		
			String content = params['content']
			post.setPostContent(content)
			
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
	}
	
	def delete() {
		def postId = params['id']
		Post p = Post.findById(postId)
		println "Post is "+p
		if (p!= null) {
			p.delete()	
		}
		redirect(controller:'post', action:'show')
	}
}
