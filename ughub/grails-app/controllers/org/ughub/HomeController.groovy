package org.ughub

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils


import org.codehaus.groovy.grails.plugins.springsecurity.openid.OpenIdAuthenticationFailureHandler as OIAFH

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.AuthenticationException
import org.springframework.security.web.savedrequest.DefaultSavedRequest

class HomeController {

	/** Dependency injection for OpenIDAuthenticationFilter. */
	def openIDAuthenticationFilter
	
    def index() { 
		
		def config = SpringSecurityUtils.securityConfig

		[openIdPostUrl: "${request.contextPath}$openIDAuthenticationFilter.filterProcessesUrl",
		 daoPostUrl:    "${request.contextPath}${config.apf.filterProcessesUrl}",
		 persistentRememberMe: config.rememberMe.persistent,
		 rememberMeParameter: config.rememberMe.parameter,
		 openidIdentifier: config.openid.claimedIdentityFieldName]
		}
}
