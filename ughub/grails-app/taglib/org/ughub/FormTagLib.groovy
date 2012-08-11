package org.ughub

class FormTagLib {
	static namespace = "ug"

	def formcontrol = { attrs, body ->
		def label = attrs.label
		
		out << """<div class='control-group'>
            <label class='control-label'>$label</label>
            <div class='controls'>
              ${body()}
            </div>
          </div>
        """
	}
}
