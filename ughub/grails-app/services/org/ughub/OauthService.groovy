package org.ughub

import groovyx.net.http.HTTPBuilder
import static groovyx.net.http.ContentType.URLENC
import org.codehaus.groovy.grails.commons.ConfigurationHolder

/**
 * Our home made version of Oauth client.
 * @author pyppo
 *
 */
class OauthService {

	def config = ConfigurationHolder.config 
	
	def oauthConfig = [
		'clientid' : '596498673516.apps.googleusercontent.com',
		'clientsecret' : config.org.ughub.oauth.clientsecret,
		'scope' : 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile',
		'redirect' : 'http://localhost:8080/ughub/oauth2/callback',
		'responsetype' : 'code',
		'providerURL' : 'https://accounts.google.com/o/oauth2/auth']
	
	/**
	 * Prepares the first token request
	 * @return
	 */
    def buildAccessTokenRequest() {
		def url = ['client_id' : oauthConfig['clientid'],
					'scope' : oauthConfig['scope'],
					'redirect' : oauthConfig['redirect'],
					'response_type' : oauthConfig['responsetype'],
					'providerUrl' : oauthConfig['providerURL']]
		return url
	}
	
	/**
	 * Performs the post to the server to get the token
	 * @param code
	 * @return
	 */
	def redeemToken(code) {
  	if (!oauthConfig['clientsecret'] || oauthConfig['clientsecret'] == '') {
  		log.warn "OAuth clientsecret is empty! Check your Config.groovy"
  	}
		def http = new HTTPBuilder( 'https://accounts.google.com' )
		
		def postBody = [
			code:code,
			client_id:oauthConfig['clientid'],
			client_secret:oauthConfig['clientsecret'],
			redirect_uri:oauthConfig['redirect'],
			grant_type:"authorization_code"
			] // will be url-encoded
		 
		  http.post( path: '/o/oauth2/token', body: postBody,
				   requestContentType: URLENC ) { resp,json ->
		 
		  if (resp.statusLine.statusCode == 200){
			  return json
		  }else{
		  	throw new RuntimeException("Error contacting google")
		  }
		}
	}
	
	/**
	 * Provides user information given as a map with this format:
	 * 
	 * "id": "104265030033687965446",
	 * "name": "James Bond",
	 * "given_name": "James",
	 * "family_name": "Bond",
	 * "link": "https://plus.google.com/104265030033687965446",
	 * "gender": "male",
	 * "locale": "en"
	 * @param token
	 * @return
	 */
	def getUserInfo(token) {
		def http = new HTTPBuilder( 'https://www.googleapis.com' )
		
		http.get( path : '/oauth2/v1/userinfo', query : ['access_token':token] ){ resp,json ->
		 
		  if (resp.statusLine.statusCode == 200){
			  return json
		  }else{
		  	throw new RuntimeException("Error contacting google")
		  }
		}
		
	}
}
