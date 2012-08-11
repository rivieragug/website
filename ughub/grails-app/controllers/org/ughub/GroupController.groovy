package org.ughub

import org.springframework.dao.DataIntegrityViolationException

class GroupController {
    def scaffold = true


    def listShort() {
    	render template: "list", model: [groups: Group.list()]
    }

    def logo() {
    	def group = Group.get(params.id)

    	if (!group) {
    		render status: 404
    		return
    	}

    	response.contentType = "image/jpeg"
    	response.outputStream << group.minilogo  	
    }

}
