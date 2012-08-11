package org.ughub

import org.springframework.dao.DataIntegrityViolationException

class BlogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [blogInstanceList: Blog.list(params), blogInstanceTotal: Blog.count()]
    }

    def create() {
        [blogInstance: new Blog(params)]
    }

    def save() {
        def blogInstance = new Blog(params)
        if (!blogInstance.save(flush: true)) {
            render(view: "create", model: [blogInstance: blogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'blog.label', default: 'Blog'), blogInstance.id])
        redirect(action: "show", id: blogInstance.id)
    }

    def show(Long id) {
        def blogInstance = Blog.get(id)
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), id])
            redirect(action: "list")
            return
        }

        [blogInstance: blogInstance]
    }

    def edit(Long id) {
        def blogInstance = Blog.get(id)
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), id])
            redirect(action: "list")
            return
        }

        [blogInstance: blogInstance]
    }

    def update(Long id, Long version) {
        def blogInstance = Blog.get(id)
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (blogInstance.version > version) {
                blogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'blog.label', default: 'Blog')] as Object[],
                          "Another user has updated this Blog while you were editing")
                render(view: "edit", model: [blogInstance: blogInstance])
                return
            }
        }

        blogInstance.properties = params

        if (!blogInstance.save(flush: true)) {
            render(view: "edit", model: [blogInstance: blogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'blog.label', default: 'Blog'), blogInstance.id])
        redirect(action: "show", id: blogInstance.id)
    }

    def delete(Long id) {
        def blogInstance = Blog.get(id)
        if (!blogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), id])
            redirect(action: "list")
            return
        }

        try {
            blogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'blog.label', default: 'Blog'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'blog.label', default: 'Blog'), id])
            redirect(action: "show", id: id)
        }
    }
}
