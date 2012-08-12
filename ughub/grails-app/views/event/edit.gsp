<html>
<head>
  <meta name="layout" content="ughub-show"/>
  <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
    <g:if test="${flash.message}">
        <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
    </g:if>
	<div class="row-fluid">
		<div class="span2 well sidebar-nav">
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
		<div class="span8 content">	
        <g:form  class="form-horizontal" name="eventCreation" url="${[action:'edit',controller:'event', id: eventInstance.id]}" enctype="multipart/form-data"
       method="post"> 
            <ug:formcontrol class="nav nav-list" label='Name'>
              <g:textField name='name' value="${eventInstance.name}"/>
            </ug:formcontrol>
            <ug:formcontrol label='Type'>
              <g:textField name='type' value="${eventInstance.type}"/>
            </ug:formcontrol>
            <ug:formcontrol label='Date'>
                <g:datePicker name="date" value="${eventInstance.date ?: new Date()}"
              noSelection="['':'-Choose-']"/>
            </ug:formcontrol>
            <ug:formcontrol label='Description'>
              <g:textArea name="description" style="width: 640px;" value="${eventInstance.description}" rows="40" cols="120"/>
            </ug:formcontrol>

            <div class="form-actions">
              <g:submitButton class="btn btn-primary" name="update" value="Update" />
            </div>

        </g:form>
      </div>
	</div>
</body>
</html>
