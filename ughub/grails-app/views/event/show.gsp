<html>
<head>
	    <meta name="layout" content="ughub-show">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div class="row-fluid">
	  <div class="span2 well sidebar-nav">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
		</div>
	
    	<div class="span8 content">
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