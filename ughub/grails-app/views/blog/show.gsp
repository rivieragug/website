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
				<g:if test="${blogInstance?.name}">
					<h1>
						<g:fieldValue bean="${blogInstance}" field="name" />
					</h1>
				</g:if>
				<g:if test="${blogInstance?.description}">
					<h2>
						<g:fieldValue bean="${blogInstance}" field="description" />
					</h2>
				</g:if>
			</div>
			Posts:<br />
			<g:each in="${blogInstance.posts}">
				<textArea name="comment">
					${it.postContent}
				</textArea>
				<br />
    By ${it.author.firstName}
				${it.author.lastName} at ${it.commentDate}<br />
    =================================== <br />
			</g:each>
		</div>
</body>
</html>
