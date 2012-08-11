import org.ughub.*

import grails.util.Environment

class BootStrap {
def grailsApplication
def tagService
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
			addTagsToDomainClasses()
			
			}
			
    
	
	/**
	 * Creates the admin user, the roles and assigns them
	 */
	def setUpUsers = {
		def adminUser = User.findByUsername('admin')
		if (adminUser == null){
			adminUser = new User(username: 'admin', password: 'admin',enabled: true).save(failOnError: true)
			def adminMember = new Member(firstName: 'admin', lastName: 'admin')
			adminMember.user = adminUser
			adminMember.save(failOnError: true)
			
		}
		
		
		//admin member
		
		
		for (r in ['ROLE_ADMIN','ROLE_BASE','ROLE_POWER']) {
			def myRole = Authority.findByAuthority(r)
			if (myRole == null){
				myRole = new Authority(authority: r).save(failOnError: true)
				new UserAuthority(authority: myRole, user : adminUser).save(failOnError : true)
			}
		}
	}
	
	/**
	 * Adds the addTag method to the concerned domain classes
	 */
	def addTagsToDomainClasses(){
		def domain = ["Blog","Event","Group","Member","Sponsor"]
		grailsApplication.domainClasses.each{
			
			
			it.metaClass.addTag = {tag->
				delegate.addToTags(tag)
				tagService.addTag(tag)
				}
			
		}
		}
	
    def destroy = {
    }
}
