
<%@ page import="org.ughub.Sponsor" %>
<!doctype html>
<html>
	<head>
	    <meta name="layout" content="ughub-show">
		<g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
				</div>
			</div>
			
			<div class="span8 content">

				<div class="page-header">
					<g:if test="${sponsorInstance?.companyName}">
						<h1><g:fieldValue bean="${sponsorInstance}" field="companyName"/></h1>
					</g:if>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${sponsorInstance?.description}">
							<dd><g:fieldValue bean="${sponsorInstance}" field="description"/></dd>
					</g:if>
				
					<g:if test="${sponsorInstance?.groups}">
						<dt><g:message code="sponsor.groups.label" default="Groups" /></dt>
						
							<g:each in="${sponsorInstance.groups}" var="g">
							<dd><g:link controller="group" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${sponsorInstance?.minilogo}">
						<dt><g:message code="sponsor.minilogo.label" default="Minilogo" /></dt>
						
							<dd><g:link controller="image" action="show" id="${sponsorInstance?.minilogo?.id}">${sponsorInstance?.minilogo?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${sponsorInstance?.website}">
						<dd><a href="${sponsorInstance.website}"/></a></dd>
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${sponsorInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${sponsorInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>
			   <div class="sponsors">
                 <div class="row-fluid">
				   <g:img dir="img/" file="logo-sopra.png"/>
				   <g:img dir="img/" file="logo-avisto.png"/>
				   <g:img dir="img/" file="logo-les-satellites.png"/>
                 </div>
               </div>
		</div>
	</body>
</html>
