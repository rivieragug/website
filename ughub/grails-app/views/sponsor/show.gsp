
<%@ page import="org.ughub.Sponsor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-main">
		<g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
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
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${sponsorInstance?.companyName}">
						<dt><g:message code="sponsor.companyName.label" default="Company Name" /></dt>
						
							<dd><g:fieldValue bean="${sponsorInstance}" field="companyName"/></dd>
						
					</g:if>
				
					<g:if test="${sponsorInstance?.description}">
						<dt><g:message code="sponsor.description.label" default="Description" /></dt>
						
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
						<dt><g:message code="sponsor.website.label" default="Website" /></dt>
						
							<dd><g:fieldValue bean="${sponsorInstance}" field="website"/></dd>
						
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
				   <g:img dir="draft/assets/img/" file="logo-sopra.png"/>
				   <g:img dir="draft/assets/img/" file="logo-avisto.png"/>
				   <g:img dir="draft/assets/img/" file="logo-les-satellites.png"/>
                 </div>
               </div>
		</div>
	</body>
</html>
