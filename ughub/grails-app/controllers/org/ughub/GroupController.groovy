package org.ughub

import org.springframework.dao.DataIntegrityViolationException

class GroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [groupInstanceList: Group.list(params), groupInstanceTotal: Group.count()]
    }

    def create() {
        [groupInstance: new Group(params)]
    }

    def save() {
        def groupInstance = new Group(params)
        if (!groupInstance.save(flush: true)) {
            render(view: "create", model: [groupInstance: groupInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'group.label', default: 'Group'), groupInstance.id])
        redirect(action: "show", id: groupInstance.id)
    }

    def show(Long id) {
        def groupInstance = Group.get(id)
        if (!groupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), id])
            redirect(action: "list")
            return
        }

        [groupInstance: groupInstance]
    }

    def edit(Long id) {
        def groupInstance = Group.get(id)
        if (!groupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), id])
            redirect(action: "list")
            return
        }

        [groupInstance: groupInstance]
    }

    def update(Long id, Long version) {
        def groupInstance = Group.get(id)
        if (!groupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (groupInstance.version > version) {
                groupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'group.label', default: 'Group')] as Object[],
                          "Another user has updated this Group while you were editing")
                render(view: "edit", model: [groupInstance: groupInstance])
                return
            }
        }

        groupInstance.properties = params

        if (!groupInstance.save(flush: true)) {
            render(view: "edit", model: [groupInstance: groupInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'group.label', default: 'Group'), groupInstance.id])
        redirect(action: "show", id: groupInstance.id)
    }

    def delete(Long id) {
        def groupInstance = Group.get(id)
        if (!groupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'group.label', default: 'Group'), id])
            redirect(action: "list")
            return
        }

        try {
            groupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'group.label', default: 'Group'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'group.label', default: 'Group'), id])
            redirect(action: "show", id: id)
        }
    }
}
