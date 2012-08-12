package org.ughub

import org.springframework.dao.DataIntegrityViolationException

class EventController {

    def scaffold = true
	
	def listShort() {
     def events = Event.findAllByDateGreaterThan(new Date())

     render template: 'list', model: [events: events]
    }

    // NOT ELEGANT : copy paste of scaffold to add
    // 	        eventInstance.description = params.description
    // because does not work with assignment. Why ?
    def edit() {
		switch (request.method) {
		case 'GET':
	        def eventInstance = Event.get(params.id)
	        if (!eventInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [eventInstance: eventInstance]
			break
		case 'POST':
	        def eventInstance = Event.get(params.id)
	        if (!eventInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (eventInstance.version > version) {
	                eventInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'event.label', default: 'Event')] as Object[],
	                          "Another user has updated this Event while you were editing")
	                render view: 'edit', model: [eventInstance: eventInstance]
	                return
	            }
	        }

	        eventInstance.properties = params
	        eventInstance.description = params.description

	        if (!eventInstance.save(flush: true)) {
	            render view: 'edit', model: [eventInstance: eventInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])
	        redirect action: 'show', id: eventInstance.id
			break
		}
    }

}
