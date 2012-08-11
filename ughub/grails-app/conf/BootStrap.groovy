import org.ughub.UserAuthority;

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
    	if (Environment.current == Environment.DEVELOPMENT){
    		if (!org.ughub.Group.count()) {
            new org.ughub.Group(name: "Coding Week-End Group", description: "Pizzas & Beers are legions", logoPath: "/tmp").save(failOnError: true)
	        }
	        if (!org.ughub.Member.count()){
	    		new org.ughub.Member(firstName: "Admin", lastName: "Admin", userName: "admin").save(failOnError: true)
	    	}
    		setUpUsers()
		}
		
		
    }
	
	/**
	 * Creates the admin user, the roles and assigns them
	 */
	def setUpUsers = {
		def adminUser = org.ughub.User.findByUsername('admin')
		if (adminUser == null){
			adminUser = new org.ughub.User(username: 'admin', password: 'admin',enabled: true).save(failOnError: true)
		}
		
		for (r in ['ADMIN','BASE_USER','POWER_USER']) {
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
