package org.ughub

import org.springframework.dao.DataIntegrityViolationException

class MemberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [memberInstanceList: Member.list(params), memberInstanceTotal: Member.count()]
    }

    def create() {
        [memberInstance: new Member(params)]
    }

    def save() {
        def memberInstance = new Member(params)
        if (!memberInstance.save(flush: true)) {
            render(view: "create", model: [memberInstance: memberInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
        redirect(action: "show", id: memberInstance.id)
    }

    def show(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        [memberInstance: memberInstance]
    }

    def edit(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        [memberInstance: memberInstance]
    }

    def update(Long id, Long version) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (memberInstance.version > version) {
                memberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'member.label', default: 'Member')] as Object[],
                          "Another user has updated this Member while you were editing")
                render(view: "edit", model: [memberInstance: memberInstance])
                return
            }
        }

        memberInstance.properties = params

        if (!memberInstance.save(flush: true)) {
            render(view: "edit", model: [memberInstance: memberInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'member.label', default: 'Member'), memberInstance.id])
        redirect(action: "show", id: memberInstance.id)
    }

    def delete(Long id) {
        def memberInstance = Member.get(id)
        if (!memberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
            return
        }

        try {
            memberInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'member.label', default: 'Member'), id])
            redirect(action: "show", id: id)
        }
    }
}
