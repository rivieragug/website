<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>

	<div class="row-fluid">
    	<div class="span6">
    		<div class="hero-unit">
	      		<h1>UG-hub Home!</h1>
	      		<p>RivieraCWE is launching UG-hub tonight!</p>
			</div>
		    <g:form name="googleLogin" method="POST"  url ="${openIdPostUrl}"> 
		    	<g:hiddenField name="${openidIdentifier}" value="${openidIdentifier}"/>
		    	<g:submitButton name="googleLogin" value="Login with google... provided they allow us"/>
		    </g:form>
    	</div>

		<div class="span5">
			<h2>The Best User Groups</h2>
			<g:include controller="group" action="listShort"/>
		</div>
	</div>
</body>
</html>