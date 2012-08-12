<%@ page import="org.ughub.Group" %>



<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="group.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${groupInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="group.events.label" default="Events" />
		
	</label>
	<g:select name="events" from="${org.ughub.Event.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${groupInstance?.events*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'minilogo', 'error')} ">
	<label for="minilogo">
		<g:message code="group.minilogo.label" default="Minilogo" />
		
	</label>
	<g:select id="minilogo" name="minilogo.id" from="${org.ughub.Image.list()}" optionKey="id" required="" value="${groupInstance?.minilogo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="group.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${groupInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'sponsors', 'error')} ">
	<label for="sponsors">
		<g:message code="group.sponsors.label" default="Sponsors" />
		
	</label>
	<g:select name="sponsors" from="${org.ughub.Sponsor.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${groupInstance?.sponsors*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="group.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${org.ughub.User.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${groupInstance?.users*.id}" class="many-to-many"/>
</div>

