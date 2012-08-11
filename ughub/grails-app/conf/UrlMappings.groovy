class UrlMappings {

	static mappings = {
		

		 "/login/openIdCreateAccount" {
			controller = 'user'
			action = 'createAccountOpenId'
		 }
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/profile" 				(controller:"user", action: "show")
		"/user/$id" 	(controller: "user", action: "show")

		'/index-dev'(view:'/index-dev')

		"/"(controller:"home", action: 'index')
		"500"(view:'/error')
	}
}
