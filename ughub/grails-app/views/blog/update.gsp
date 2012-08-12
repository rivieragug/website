<!doctype html>
<html>
<head>
<meta name="layout" content="ughub-show">
<g:set var="entityName"
	value="${message(code: 'post.label', default: 'Post')}" />
<title><g:message code="default.update.label"
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
				<h1>Update Blog description:</h1>
			</div>
			<g:message code="${flash.message}" />
			<g:form class="form-horizontal" name="blogUpdate"
				url="[action:'edit',controller:'blog']">
				<ug:formcontrol label='Blog name'>
					<g:textField name="name"
						value="${(flash.name==null)?blogInstance.name:flash.name}" />
				</ug:formcontrol>

				<ug:formcontrol label='Blog description'>
					<g:textArea name="content" rows="20" cols="80"
						value="${(flash.description==null)?blogInstance.description:flash.description}" />
				</ug:formcontrol>
				<div class="form-actions">
					<g:submitButton class="btn btn-primary" name="update"
						value="Update" />
				</div>
				<g:hiddenField name="id" value="${blogInstance.id}" />
			</g:form>
		</div>
	</div>
</body>
</html>