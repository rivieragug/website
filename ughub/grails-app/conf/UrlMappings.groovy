class UrlMappings {

	static mappings = {
		

		 "/login/openIdCreateAccount" {
			controller = 'member'
			action = 'createAccountOpenId'
		 }
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"home", action: 'index')
		"500"(view:'/error')
	}
}
