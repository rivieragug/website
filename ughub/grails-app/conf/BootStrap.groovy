import org.ughub.*

import grails.util.Environment

class BootStrap {
def grailsApplication
def tagService
    def init = { servletContext ->
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
    		setUpUsers()
			setUpSponsors()
//		}
			addTagsToDomainClasses()
			
	}
			
    
	
	def setUpSponsors = {
		if(!Sponsor.count()) {
			new Sponsor(companyName:"SOPRA", 
				        description:"SSII intersted in J2EE based technologies",
						 website:new URL("http://grails.org/")).save(failOnError: true)
		
		}
	}
	
	
	/**
	 * Creates the admin user, the roles and assigns them
	 */
	def setUpUsers = {
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
	
    def destroy = {
    }
}
