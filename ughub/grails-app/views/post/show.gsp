<!doctype html>
<html>
<head>
<meta name="layout" content="ughub-show">
<g:set var="entityName"
	value="${message(code: 'post.label', default: 'Post')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">

		<div class="span2 well sidebar-nav">
			<div class="well">
				<ul class="nav nav-list">
					<li class="nav-header">
						${entityName}
					</li>
					<li><g:link class="list" action="list">
							<i class="icon-list"></i>
							<g:message code="default.list.label" args="[entityName]" />
						</g:link></li>
					<li><g:link class="create" action="create">
							<i class="icon-plus"></i>
							<g:message code="default.create.label" args="[entityName]" />
						</g:link></li>
				</ul>
			</div>
		</div>

		<div class="span8 content">

			<div class="page-header">
				<h1>
					${postInstance.referenceBlog.name}
				</h1>
				<h2>
					${postInstance.title}
				</h2>

			</div>
			<textArea cols='20' name="content" readonly="true"> ${postInstance.postContent}"</textArea>
			<br /> From
			${postInstance.author.firstName}
			${postInstance.author.lastName}
			at
			${postInstance.postDate}(Last Modif:
			${postInstance.lastUpdateDate})<br /> <br />Comments:<br />
			<g:each in="${postInstance.comments}">
				<textArea name="comment">
						${it.comment}
					</textArea>
				<br />
    By ${it.author.firstName}
				${it.author.lastName} at ${it.commentDate}<br />
    =================================== <br />
			</g:each>
			<br /> Add a new comment:
			<g:form class="form-horizontal" name="postCreation"
				url="[action:'save',controller:'postComment']">
				<ug:formcontrol label='comment'>
					<g:textArea name="comment" rows="20" cols="80"
						value="${(flash.comment==null)?'':flash.comment}" />
				</ug:formcontrol>
				<div class="form-actions">
					<g:submitButton class="btn btn-primary" name="create"
						value="Create" />
				</div>
				<g:hiddenField name="post.id" value="${postInstance.id}" />
			</g:form>
		</div>
	</div>
</body>
</html>
