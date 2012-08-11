package org.ughub

import org.springframework.dao.DataIntegrityViolationException

class EventController {
    def scaffold = true

    def listShort() {
    	def events = Event.findAllByDateGreaterThan(new Date())

    	render template: 'list', model: [events: events]
    }
}
