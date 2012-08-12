
<%@ page import="org.ughub.Sponsor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-show">
		<g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span2 well sidebar-nav">
				<ul class="nav nav-list">
					<li class="nav-header">${entityName}</li>
					<li class="active">
						<g:link class="list" action="list">
							<i class="icon-list icon-white"></i>
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

			<div class="span8 content">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="companyName" title="${message(code: 'sponsor.companyName.label', default: 'Company Name')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'sponsor.description.label', default: 'Description')}" />
						
							<th class="header"><g:message code="sponsor.minilogo.label" default="Minilogo" /></th>
						
							<g:sortableColumn property="website" title="${message(code: 'sponsor.website.label', default: 'Website')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${sponsorInstanceList}" var="sponsorInstance">
						<tr>
						
							<td>${fieldValue(bean: sponsorInstance, field: "companyName")}</td>
						
							<td>${fieldValue(bean: sponsorInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: sponsorInstance, field: "minilogo")}</td>
						
							<td>${fieldValue(bean: sponsorInstance, field: "website")}</td>
						
							<td class="link">
								<g:link action="show" id="${sponsorInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${sponsorInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
