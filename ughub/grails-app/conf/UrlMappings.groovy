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

		"/profile" 				(controller:"member", action: "show")
		"/member/$id" 	(controller: "member", action: "show")

		"/"(controller:"home", action: 'index')
		"500"(view:'/error')
	}
}
