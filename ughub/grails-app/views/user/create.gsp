<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <div class="well">
      <h1>Register</h1>
      <g:message code="${flash.message}"/>
      <g:form  class="form-horizontal" name="userCreation" url="[action:'save',controller:'user']"> 
      	<g:if test="${flash.GOOGLE_AUTH}">
      		Oauth user creation with google profile
      	</g:if>
      	<g:else>
      		Standard user name / password user creation
      	</g:else>
      	
      	<ug:formcontrol label='User Name'>
          <g:textField name="username" value="${username}"/>
        </ug:formcontrol>
      	<ug:formcontrol label='Name'>
          <g:textField name="firstName" value="${firstName}"/>
        </ug:formcontrol>
      	<ug:formcontrol label='Last Name'>
          <g:textField name="lastName" value="${lastName}"/>
        </ug:formcontrol>
      	<ug:formcontrol label='Password'>
          <g:passwordField name="password"/>
        </ug:formcontrol>

        <div class="form-actions">
      	  <g:submitButton class="btn btn-primary" name="create" value="Register" />
        </div>

      </g:form>
    </div>
</body>
</html>