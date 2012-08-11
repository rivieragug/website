import org.ughub.*

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
//    	if (Environment.current == Environment.DEVELOPMENT){
    		if (!Group.count()) {
    			def logo = new File('testdata', 'logo.jpeg').bytes
    			def img = new Image(data: logo, mimetype: 'image/jpeg').save(failOnError: true)
				new Group(
					name: "Coding Week-End Group",
					description: "Pizzas & Beers are legions",
					logoPath: "/tmp",
					minilogo: img
				).save(failOnError: true)
	        }
    		setUpUsers()
//		}
		
		
    }
	
	/**
	 * Creates the admin user, the roles and assigns them
	 */
	def setUpUsers = {
		def adminUser = User.findByUsername('admin')
		if (adminUser == null){
			adminUser = new User(username: 'admin', password: 'admin',enabled: true).save(failOnError: true)
		}
		
		for (r in ['ROLE_ADMIN','ROLE_BASE','ROLE_POWER']) {
			def myRole = Authority.findByAuthority(r)
			if (myRole == null){
				myRole = new Authority(authority: r).save(failOnError: true)
				new UserAuthority(authority: myRole, user : adminUser).save(failOnError : true)
			}
		}
	}
	
    def destroy = {
    }
}
