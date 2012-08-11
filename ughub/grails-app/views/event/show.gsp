<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>

	<div class="row-fluid">
    	<div class="span6">
    		<h1>${eventInstance.name} <small>${eventInstance.type}</small></h1>
            <g:if test="${flash.message}">
                <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
            </g:if>
            <h2>${eventInstance.date}</h2>
      		<hr>
            <g:link class="btn btn-large" action='edit' id="${eventInstance.id}">Edit</g:link>
    		<div class='well'>
    			<markdown:renderHtml>${eventInstance.description}</markdown:renderHtml>
    		</div>
    	</div>

	</div>
</body>
</html>