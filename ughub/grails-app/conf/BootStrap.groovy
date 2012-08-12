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
    			def logo = new File('testdata', 'logo.jpeg').bytes
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
						name: "Event ${it}", type: "Fake event", date: now + it*2,
						description: """
Install procedure
=================
Here is a procedure to install all pre-requisites softwares. Links section gives you the URL. Then each section gives you the installion command. We recommand you do the install stuff before the WE.

Links
-----
* Java sun 1.7 update 5
<http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1637583.html>

* GGTS
<http://www.springsource.org/downloads/sts>

click on _OTHER DOWNLOADS >_ and look for GROOVY/GRAILS TOOL SUITE 3.0.0

* Groovy 1.8.6
<http://groovy.codehaus.org/Download>

* Grails 2.1.0
<http://grails.org/Download/>

* Git 
<http://git-scm.com/>

* HTML5 browser + Web developer environment: For example Firefox + Firebug

Linux
-----

_Warning_: this install intructions is only for Ubuntu-debian based distribution

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
	def setUpUsers = {gug->
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
		gug.addToUsers(adminUser)
		gug.addToUsers(adminUser2)
		gug.addToUsers(adminUser3)
		gug.addToUsers(adminUser4)
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
