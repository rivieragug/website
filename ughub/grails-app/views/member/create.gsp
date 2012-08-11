<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <div class="hero-unit">
      <h1>Member creation</h1>
      <g:message code="${flash.message}"/>
      <g:form name="memberCreation" url="[action:'save',controller:'member']"> 
      	UserName <g:textField  name="username" value="${username}" /><br>
      	Name <g:textField name="firstName"/><br>
      	Last Name <g:textField name="lastName"/><br>
      	Password <g:passwordField  name="password"/><br>
      	<g:submitButton name="create" value="Create" />
      </g:form>
    </div>
</body>
</html>