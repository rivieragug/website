package org.ughub

import grails.converters.JSON;

class TagController {
def tagService
    def index() { }
	
	def getTagsByName(){
		println "my term params $params"
		tagService.findTagByName(params.term) as JSON
	}
}
