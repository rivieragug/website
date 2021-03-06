import org.ughub.*

import grails.util.Environment
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class BootStrap {
	def grailsApplication
	def tagService

    def init = { servletContext ->
		checkOauthSecret()
//    	if (Environment.current == Environment.DEVELOPMENT){



			def gug = Group.findByName("Coding Week-End Group")
    		if (!gug) {

    			def logo = grailsApplication.mainContext.getResource('/images/logo.jpeg').inputStream.bytes
    			def img = new Image(data: logo, mimetype: 'image/jpeg').save(failOnError: true)
				gug = new Group(
					name: "Coding Week-End Group",
					description: "Pizzas & Beers are legions",
					logoPath: "/tmp",
					minilogo: img
				).save(failOnError: true)
	        }

	        // create some events
	        if (!gug.events?.size()) {
				def now = new Date()
				3.times {
					def event = new Event(
						name: "Coding Week-End ${it}", type: "Coding Week-End", date: now + it*2,
						organizingGroup: gug,
						description: """
Come Have fun coding and geeking !!!
------------------------------------

* beer !
* bugs !

"""
					).save(failOnError: true)
					gug.addToEvents(event)
					gug.save()
				}
			}
    		setUpUsers(gug)
			setUpSponsors(gug)
//		}
			addTagsToDomainClasses()
	}
			
    
	
	def setUpSponsors = {gug->
		if(!Sponsor.count()) {
			def logo = new File('testdata', 'logo.jpeg').bytes
    		def img = new Image(data: logo, mimetype: 'image/jpeg').save(failOnError: true)
				
			def sopra = new Sponsor(companyName:"SOPRA", 
				        description:"SSII intersted in J2EE based technologies",
						 website:new URL("http://grails.org/"),
						 minilogo: img).save(failOnError: true)
			
			def avisto = new Sponsor(companyName:"AVISTO", 
				        description:"SSII intersted in J2EE based technologies",
						 website:new URL("http://grails.org/"),
						 minilogo: img).save(failOnError: true)
			def sopra2 = new Sponsor(companyName:"SOPRA2", 
				        description:"SSII intersted in J2EE based technologies",
						 website:new URL("http://grails.org/"),
						 minilogo: img).save(failOnError: true)
			
			def avisto2 = new Sponsor(companyName:"AVISTO2", 
				        description:"SSII intersted in J2EE based technologies",
						 website:new URL("http://grails.org/"),
						 minilogo: img).save(failOnError: true)
			def sopra3 = new Sponsor(companyName:"SOPRA3", 
				        description:"SSII intersted in J2EE based technologies",
						 website:new URL("http://grails.org/"),
						 minilogo: img).save(failOnError: true)
			
			def avisto3 = new Sponsor(companyName:"AVISTO3", 
				        description:"SSII intersted in J2EE based technologies",
						 website:new URL("http://grails.org/"),
						 minilogo: img).save(failOnError: true)
			gug.addToSponsors(sopra)
			gug.addToSponsors(avisto)
			gug.addToSponsors(sopra2)
			gug.addToSponsors(avisto2)
			gug.addToSponsors(sopra3)
			gug.addToSponsors(avisto3)
			gug.save()
		}
		
	}
	

	/**
	 * Creates the admin user, the roles and assigns them
	 */
	def setUpUsers = { gug->
		def adminUser = User.findByUsername('admin')
		if (adminUser == null){
			adminUser = new User(
				username: 'admin',
				password: 'admin',
				firstName: 'admin',
				lastName: 'admin',
				enabled: true
			).save(failOnError: true)			
		}
		def adminUser2 = User.findByUsername('admin2')
		if (adminUser2 == null){
			adminUser2 = new User(
				username: 'admin2',
				password: 'admin2',
				firstName: 'admin2',
				lastName: 'admin2',
				enabled: true
			).save(failOnError: true)			
		}
		def adminUser3 = User.findByUsername('admin3')
		if (adminUser3 == null){
			adminUser3 = new User(
				username: 'admin3',
				password: 'admin3',
				firstName: 'admin3',
				lastName: 'admin3',
				enabled: true
			).save(failOnError: true)			
		}
		def adminUser4 = User.findByUsername('admin4')
		if (adminUser4 == null){
			adminUser4 = new User(
				username: 'admin4',
				password: 'admin4',
				firstName: 'admin4',
				lastName: 'admin4',
				enabled: true
			).save(failOnError: true)			
		}
		gug.addMember(adminUser)
		gug.addMember(adminUser2)
		gug.addMember(adminUser3)
		gug.addMember(adminUser4)
		gug.save()
		
		//admin user
		
		
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
		def domain = ["Blog","Event","Group","User","Sponsor"]
		grailsApplication.domainClasses.each{
			
			
			it.metaClass.addTag = {tag->
				delegate.addToTags(tag)
				tagService.addTag(tag)
				}
			
		}
	}

	def checkOauthSecret() {
		def config = ConfigurationHolder.config
		def secret = config.org.ughub.oauth.clientsecret
		if (!secret){
			throw new OauthConfigException('Oauth client secret not configured. Thanks to set it in org.ughub.oauth.clientsecret config')
		}
	}

    def destroy = {
    }
	
	class OauthConfigException extends RuntimeException {
		public OauthConfigException(String message){
			super(message)
		}
	}
}
