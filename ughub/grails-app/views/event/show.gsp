<html>
<head>
  <meta name="layout" content="ughub-main"/>
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
                <sec:ifLoggedIn>
                    <g:form class="pull-right">
                        <g:hiddenField name="id" value="${eventInstance?.id}" />
                        <div>
                            <g:link class="btn" action="edit" id="${eventInstance?.id}">
                                <i class="icon-pencil"></i>
                                <g:message code="default.button.edit.label" default="Edit" />
                            </g:link>
                            <button class="btn btn-danger" type="submit" name="_action_delete">
                                <i class="icon-trash icon-white"></i>
                                <g:message code="default.button.delete.label" default="Delete" />
                            </button>
                        </div>
                    </g:form>
                </sec:ifLoggedIn>
				</div>
		</div>
	
    	<div class="span8 content">
                <h1><g:if test="${eventInstance?.name}"><g:fieldValue bean="${eventInstance}" field="name"/></g:if>
                    <small>${eventInstance.type}</small>
                </h1>
            <h2>${eventInstance.date}</h2>
      		<hr>
            <g:link class="btn btn-large" action='edit' id="${eventInstance.id}">Edit</g:link>
    		<div class='well'>
    			<markdown:renderHtml>${eventInstance.description}</markdown:renderHtml>
    		</div>
    	</div>

</body>
</html>