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
		
		<g:form name="googleLogin" method="POST"  url ="${openIdPostUrl}"> 
    	<g:hiddenField name="${openidIdentifier}" value="${openidIdentifier}"/>
    	<g:submitButton name="googleLogin" value="Login with google... provided they allow us"/>
    </g:form>    
    </div>
</body>
</html>
