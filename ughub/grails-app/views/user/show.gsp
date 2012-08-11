
<%@ page import="org.ughub.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:fieldValue bean="${userInstance}" field="firstName"/> 
            <g:fieldValue bean="${userInstance}" field="lastName"/></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span12">

				<div class="page-header">
					<h1>
            <g:fieldValue bean="${userInstance}" field="firstName"/> 
            <g:fieldValue bean="${userInstance}" field="lastName"/>
          </h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>


				<dl>
				
          <g:if test="${userInstance?.username}">
            <dt><g:message code="user.username.label" default="Username" /></dt>
              <dd><g:fieldValue bean="${userInstance}" field="username"/></dd>
          </g:if>
        
          <dt><g:message code="user.groups.label" default="Groups" /></dt>
					<g:if test="${userInstance?.groups}">
							<g:each in="${userInstance.groups}" var="g">
							<dd>
                <g:link controller="group" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link>
              </dd>
							</g:each>	
					</g:if>
          <g:else>
            <dd>
              <g:message code="user.no-groups.label" default="You don't belong to any group" />
            </dd>
            <dd>
              <g:link class="btn btn-primary" controller="group" action="list">
                <i class="icon-chevron-right icon-white"></i>
                <g:message code="default.button.find-group.label" default="Go find one!" />
              </g:link>
            </dd>
          </g:else>
				
				</dl>

        <ug:isProfileOwner userId="${userInstance.id}">
  				<g:form>
  					<g:hiddenField name="id" value="${userInstance?.id}" />
  					<div class="form-actions">
  						<g:link class="btn" action="edit" id="${userInstance?.id}">
  							<i class="icon-pencil"></i>
  							<g:message code="default.button.edit-profile.label" default="Edit Your profile" />
  						</g:link>
  					</div>
  				</g:form>
        </ug:isProfileOwner>

			</div>

		</div>
	</body>
</html>
