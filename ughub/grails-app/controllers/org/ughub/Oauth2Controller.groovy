package org.ughub

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class Oauth2Controller {

	/** Dependency injection for the springSecurityService. */
	def springSecurityService
	
	/**
	 * Injected oauth service
	 */
	def oauthService
	
	def userService
	
	/**
	 * Recover user information from the user
	 * @return
	 */
    def callback()   {
		def config = SpringSecurityUtils.securityConfig
		
			def code = params['code']
			def resp = oauthService.redeemToken(code)
			session['GOOGLE_TOKEN'] = resp['access_token']
			flash.put('GOOGLE_AUTH', true)
			def userInfo = oauthService.getUserInfo(resp['access_token'])
			
			def email = userInfo['email']
			def u = User.findByUsername(email)
			if (u == null){
				//need a registration
				render(view : '../user/create', model : [username : email , 
					oauth : true, controlsDisabled:'disabled', firstName: userInfo['given_name'], lastName: userInfo['family_name']])
			}else {
				//need a login
				userService.forceUserLogin(email)
				redirect uri: config.successHandler.defaultTargetUrl
			}
		}
}
