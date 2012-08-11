package ughub

import org.ughub.Tag;

class TagService {

    def addTag(tag) {
		new Tag(name:tag).save()
    }
}
