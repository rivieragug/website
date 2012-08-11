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
    	}
    }
    def destroy = {
    }
}
