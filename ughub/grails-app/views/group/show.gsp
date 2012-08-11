
<%@ page import="org.ughub.Group" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-group" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-group" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list group">
			
				<g:if test="${groupInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="group.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${groupInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.events}">
				<li class="fieldcontain">
					<span id="events-label" class="property-label"><g:message code="group.events.label" default="Events" /></span>
					
						<g:each in="${groupInstance.events}" var="e">
						<span class="property-value" aria-labelledby="events-label"><g:link controller="event" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.logoPath}">
				<li class="fieldcontain">
					<span id="logoPath-label" class="property-label"><g:message code="group.logoPath.label" default="Logo Path" /></span>
					
						<span class="property-value" aria-labelledby="logoPath-label"><g:fieldValue bean="${groupInstance}" field="logoPath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.members}">
				<li class="fieldcontain">
					<span id="members-label" class="property-label"><g:message code="group.members.label" default="Members" /></span>
					
						<g:each in="${groupInstance.members}" var="m">
						<span class="property-value" aria-labelledby="members-label"><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${groupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="group.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${groupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${groupInstance?.id}" />
					<g:link class="edit" action="edit" id="${groupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
