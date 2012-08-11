package ughub

import org.ughub.Tag;

class TagService {

    def addTag(tag) {
		new Tag(name:tag).save()
    }
	
	def findAllTags(){
		Tag.findAll()
	}
	
	def findTagByName(tag){
		Tag.findByName(tag)
	}
}
