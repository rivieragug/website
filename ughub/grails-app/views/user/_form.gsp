<%@ page import="org.ughub.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${userInstance?.firstName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'groups', 'error')} ">
	<label for="groups">
		<g:message code="user.groups.label" default="Groups" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userInstance?.lastName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'openIds', 'error')} ">
	<label for="openIds">
		<g:message code="user.openIds.label" default="Open Ids" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.openIds?}" var="o">
    <li><g:link controller="openID" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="openID" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'openID.label', default: 'OpenID')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${userInstance?.username}" />
</div>

