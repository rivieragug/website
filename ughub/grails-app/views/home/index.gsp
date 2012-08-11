<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <div class="hero-unit">
      <h1>UG-hub Home!</h1>
      <p>RivieraCWE is launching UG-hub tonight!</p>
    </div>
    <g:form name="googleLogin" method="POST"  url ="${openIdPostUrl}"> 
    	<g:hiddenField name="${openidIdentifier}" value="${openidIdentifier}"/>
    	<g:submitButton name="googleLogin" value="Login with google... provided they allow us"/>
    </g:form>
</body>
</html>