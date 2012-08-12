<%@page import="org.ughub.Group"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="ughub-show">
<g:set var="entityName"
	value="${message(code: 'blog.label', default: 'Blog')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">

		<div class="span2 well sidebar-nav">
			<ul class="nav nav-list">
				<li class="nav-header">
					${entityName}
				</li>
				<li><g:link class="list" action="list">
						<i class="icon-list"></i>
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
				<li class="active"><g:link class="create" action="create">
						<i class="icon-plus icon-white"></i>
						<g:message code="default.create.label" args="[entityName]" />
					</g:link></li>
			</ul>
		</div>

		<div class="span8 content">

			<div class="page-header">
				<h1>Create a new Blog:</h1>
			</div>
			<g:message code="${flash.message}" />
			<g:form class="form-horizontal" name="blogCreation"
				url="[action:'save',controller:'blog']">
				<ug:formcontrol label='Blog name'>
					<g:textField name="name"
						value="${(flash.name==null)?'':flash.name}" />
				</ug:formcontrol>

				<ug:formcontrol label='Blog description'>
					<g:textArea name="description" rows="20" cols="80"
						value="${(flash.description==null)?'':flash.description}" />
				</ug:formcontrol>
				<div class="form-actions">
					<g:submitButton class="btn btn-primary" name="create"
						value="Create" />
				</div>
				<g:select name="group.id" from="${Group.findAll()}" />
			</g:form>
		</div>
	</div>
</body>
</html>