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
		"/member/$id/profile" 	(controller: "member", action: "show")

		'/index-dev'(view:'/index-dev')

		"/"(controller:"home", action: 'index')
		"500"(view:'/error')
	}
}
