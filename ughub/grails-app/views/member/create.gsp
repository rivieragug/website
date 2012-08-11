<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <div class="well">
      <h1>Register</h1>
      <g:message code="${flash.message}"/>
      <g:form  class="form-horizontal" name="memberCreation" url="[action:'save',controller:'member']"> 
      	<ug:formcontrol label='User Name'>
          <g:textField name="username"/>
        </ug:formcontrol>
      	<ug:formcontrol label='Name'>
          <g:textField name="firstName"/>
        </ug:formcontrol>
      	<ug:formcontrol label='Last Name'>
          <g:textField name="lastName"/>
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