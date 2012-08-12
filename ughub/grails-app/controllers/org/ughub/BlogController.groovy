package org.ughub

import org.springframework.dao.DataIntegrityViolationException

class BlogController {
    def scaffold = true
	
	def create() {
		render(view:'create',model:params)
	}

	def update() {
		def blogId = params['id']
		Blog blog = Blog.findById(blogId)
		if (blog!= null) {
			render(view:'update',model:[blogInstance:blog,id:blogId])
		} else {
			redirect(controller:'blog', action:'list')
		}
	}

	def save() {
		
		println "params are $params"
		Blog blog = new Blog()
		String name = params['name']
		blog.setName(name)
		
		String description = params['description']
		blog.setDescription(description)
		
		Group refGroup = Group.findById(params['group.id'])
		blog.setGroup(refGroup)
		blog.setCreationDate(new Date())
		blog.setUpdateDate(new Date())
		
		if (!blog.save()) {
				flash.put('name', name)
				flash.put('description', description)
				flash.put('group.id', refGroup?.id)
		
			flash.message='Failed to create blog'
			redirect(action : 'create')
		} else {
			redirect(controller:'blog', action:'list')
		}
	}
	
	def edit() {
		def blogId = params['id']
		Blog blog = Blog.findById(blogId)
			
		String name = params['name']
		blog.setName(name)
		
			String description = params['description']
			blog.setDescription(description)
			
			blog.setUpdateDate(new Date())
			
			if (!blog.save()) {
				flash.put('name', name)
				flash.put('description', description)
				flash.message='Failed to update blog description'
				redirect(action : 'create',params:["group.id":params['group.id']])
			} else {
				redirect(controller:'blog', action:'list')
			}
	
		}
}
