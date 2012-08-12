<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <div class="well">
		<h1>Login</h1>
		<g:message code="${flash.message}"/>
		<g:form name="loginForm" class="form-horizontal" url='${daoPostUrl}' method='POST' id='loginForm' > 
		<ug:formcontrol label='User Name'>
          <g:textField name="j_username"/>
        </ug:formcontrol>
      	<ug:formcontrol label='Password'>
          <g:textField name="j_password"/>
        </ug:formcontrol>
        <g:submitButton name="Login"/>
		</g:form>
    
    	<g:form name="oauthLogin" method="GET"  url ='${oauthUrl.providerUrl}'> 
    	<g:hiddenField name="client_id" value="${oauthUrl.client_id}"/>
    	<g:hiddenField name="scope" value="${oauthUrl.scope}"/>
    	<g:hiddenField name="redirect_uri" value="${oauthUrl.redirect}"/>
    	<g:hiddenField name="response_type" value="${oauthUrl.response_type}"/>
    	<g:submitButton name="googleLogin" value="Login with google through OAuth"/>
    	</g:form>    
    </div>
</body>
</html>
