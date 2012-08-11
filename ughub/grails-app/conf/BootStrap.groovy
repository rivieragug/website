import org.ughub.UserAuthority;

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
//    	if (Environment.current == Environment.DEVELOPMENT){
    		if (!org.ughub.Group.count()) {
				new org.ughub.Group(name: "Coding Week-End Group", description: "Pizzas & Beers are legions", logoPath: "/tmp").save(failOnError: true)
	        }
    		setUpUsers()
//		}
		
		
    }
	
	/**
	 * Creates the admin user, the roles and assigns them
	 */
	def setUpUsers = {
		def adminUser = org.ughub.User.findByUsername('admin')
		if (adminUser == null){
			adminUser = new org.ughub.User(username: 'admin', password: 'admin',enabled: true).save(failOnError: true)
		}
		
		//admin member
		
		
		for (r in ['ROLE_ADMIN','ROLE_BASE','ROLE_POWER']) {
			def myRole = org.ughub.Authority.findByAuthority(r)
			if (myRole == null){
				myRole = new org.ughub.Authority(authority: r).save(failOnError: true)
				new UserAuthority(authority: myRole, user : adminUser).save(failOnError : true)
			}
		}
	}
	
    def destroy = {
    }
}
