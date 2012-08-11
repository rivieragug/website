<%@ page import="org.ughub.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'groups', 'error')} ">
	<label for="groups">
		<g:message code="event.groups.label" default="Groups" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="event.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="event.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${eventInstance?.type}" />
</div>

