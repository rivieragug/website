package org.ughub

class ImageController {
	
	def show() {
		def img = Image.get(params.id)

		if (!img) {
			render status: 404
			return
		}

		response.contentType = img.mimetype
    	response.outputStream << img.data
	}
}