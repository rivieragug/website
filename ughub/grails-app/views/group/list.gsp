
<%@ page import="org.ughub.Group" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-show">
		<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
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
						
							<g:sortableColumn property="description" title="${message(code: 'group.description.label', default: 'Description')}" />
						
							<th class="header"><g:message code="group.minilogo.label" default="Minilogo" /></th>
						
							<g:sortableColumn property="name" title="${message(code: 'group.name.label', default: 'Name')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${groupInstanceList}" var="groupInstance">
						<tr>
						
							<td>${fieldValue(bean: groupInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: groupInstance, field: "minilogo")}</td>
						
							<td>${fieldValue(bean: groupInstance, field: "name")}</td>
						
							<td class="link">
								<g:link action="show" id="${groupInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${groupInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
