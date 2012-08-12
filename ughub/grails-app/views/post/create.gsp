<!doctype html>
<html>
<head>
<meta name="layout" content="ughub-show">
<g:set var="entityName"
	value="${message(code: 'post.label', default: 'Post')}" />
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
				<h1>Post an entry in Blog:</h1>
			</div>
			<g:message code="${flash.message}" />
			<g:form class="form-horizontal" name="postCreation"
				url="[action:'save',controller:'post']">
				<ug:formcontrol label='Post title'>
					<g:textField name="title"
						value="${(flash.title==null)?'':flash.title}" />
				</ug:formcontrol>

				<ug:formcontrol label='Post content'>
					<g:textArea name="content" rows="20" cols="80"
						value="${(flash.content==null)?'':flash.comment}" />
				</ug:formcontrol>
				<div class="form-actions">
					<g:submitButton class="btn btn-primary" name="create"
						value="Create" />
				</div>
				<g:hiddenField name="blog.id" value="${blog.id}" />
			</g:form>
		</div>
	</div>
</body>
</html>