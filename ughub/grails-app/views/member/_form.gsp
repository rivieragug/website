<%@ page import="org.ughub.Member" %>



<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="member.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${memberInstance?.firstName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'groups', 'error')} ">
	<label for="groups">
		<g:message code="member.groups.label" default="Groups" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="member.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${memberInstance?.lastName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="member.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" value="${memberInstance?.userName}" />
</div>

