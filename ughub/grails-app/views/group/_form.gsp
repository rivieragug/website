<%@ page import="org.ughub.Group" %>



<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="group.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${groupInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'logoPath', 'error')} ">
	<label for="logoPath">
		<g:message code="group.logoPath.label" default="Logo Path" />
		
	</label>
	<g:textField name="logoPath" value="${groupInstance?.logoPath}" />
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="group.members.label" default="Members" />
		
	</label>
	<g:select name="members" from="${org.ughub.Member.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${groupInstance?.members*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="group.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${groupInstance?.name}" />
</div>

