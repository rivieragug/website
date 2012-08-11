
<%@ page import="org.ughub.Member" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<!--div class="span3">
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
			</div-->
			
			<div class="span12">

				<div class="page-header">
					<h1>
            <g:fieldValue bean="${memberInstance}" field="firstName"/> 
            <g:fieldValue bean="${memberInstance}" field="lastName"/>
          </h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>


				<dl>
				
					<g:if test="${memberInstance?.groups}">
						<dt><g:message code="member.groups.label" default="Groups" /></dt>
						
							<g:each in="${memberInstance.groups}" var="g">
							<dd><g:link controller="group" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${memberInstance?.user?.username}">
						<dt><g:message code="member.user.username.label" default="Username" /></dt>
						
							<dd><g:fieldValue bean="${memberInstance.user}" field="username"/></dd>
						
					</g:if>
				
				</dl>

        <ug:isProfileOwner memberId="${memberInstance.id}">
  				<g:form>
  					<g:hiddenField name="id" value="${memberInstance?.id}" />
  					<div class="form-actions">
  						<g:link class="btn" action="edit" id="${memberInstance?.id}">
  							<i class="icon-pencil"></i>
  							<g:message code="default.button.edit.label" default="Edit" />
  						</g:link>
  						<button class="btn btn-danger" type="submit" name="_action_delete">
  							<i class="icon-trash icon-white"></i>
  							<g:message code="default.button.delete.label" default="Delete" />
  						</button>
  					</div>
  				</g:form>
        </ug:isProfileOwner>

			</div>

		</div>
	</body>
</html>
