
<%@ page import="org.ughub.Group" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-show">
		<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span7 content">
				<!-- Group header -->
				<div class="page-header">
					<sec:ifLoggedIn>
						<g:form class="pull-right">
							<g:hiddenField name="id" value="${groupInstance?.id}" />
							<div>
								<g:link class="btn" action="edit" id="${groupInstance?.id}">
									<i class="icon-pencil"></i>
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<button class="btn btn-danger" type="submit" name="_action_delete">
									<i class="icon-trash icon-white"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</g:form>
					</sec:ifLoggedIn>
					<h1><g:if test="${groupInstance?.name}"><g:fieldValue bean="${groupInstance}" field="name"/></g:if></h1>
				</div>
				
				<!-- Group infos -->
				<div>
					<g:if test="${groupInstance?.minilogo}">
						<img src="${createLink(action:'show',controller:'image', id:groupInstance?.minilogo?.id)}" class="pull-left"/>
					</g:if>

					<div class="right-bloc">
						<dl>
							<g:if test="${groupInstance?.description}">
								<dt><g:message code="group.description.label" default="Description" /></dt>
								
									<dd><g:fieldValue bean="${groupInstance}" field="description"/></dd>
							</g:if>

							
							<dt><g:message code="group.tags.label" default="Tags" /></dt>
							<g:if test="${groupInstance?.tags}">
								<g:each in="${groupInstance.tags}" var="t">
									<span class="label label-inverse"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
									</g:each>
							</g:if>
						</dl>
					</div>
				</div>

				<!-- Events -->
				<div>
					<hr class="separator"/>
					<div>
						<sec:ifLoggedIn>
							<g:form class="pull-right">
								<g:hiddenField name="id" value="${groupInstance?.id}" />
								<div>
									<g:link class="btn" action="edit" id="${groupInstance?.id}">
										<i class="icon-pencil"></i>
										<g:message code="default.button.list.label" default="Lister tous les events" />
									</g:link>
									<button class="btn btn-success" type="submit" name="_action_delete">
										<i class="icon-trash icon-white"></i>
										<g:message code="default.button.creer.label" default="Créer un event" />
									</button>
								</div>
							</g:form>
						</sec:ifLoggedIn>
						<h3><g:message code="group.events.label" default="Events" /></h3>
					</div>
					<dl>
						<g:if test="${groupInstance?.events}">
							<g:each in="${groupInstance.events}" var="e">
								<dt><g:link controller="event" action="show" id="${e.id}">${e?.date?.encodeAsHTML()} - ${e?.encodeAsHTML()}</g:link></dt>
								<dd><h4>TYPE : ${e?.type?.encodeAsHTML()}</h4></dd>
								<dd><img src="http://placehold.it/170x170" title="${s?.encodeAsHTML()}" alt="${s?.encodeAsHTML()}" class="event-image pull-left"/><div class="right-bloc">${e?.description?.encodeAsHTML()}</div></dd>
								<hr class="separator"/>
							</g:each>

						</g:if>
					</dl>
				</div>
			</div>

			<!-- Sponsors -->
			<ul class="span3 well sidebar-nav thumbnails">
				<dt><g:message code="group.sponsors.label" default="Sponsors" /></dt>
				<g:if test="${groupInstance?.sponsors}">
					<g:each in="${groupInstance.sponsors}" var="s">
						<li class="sponsor-logo">
							<div class="thumbnail">
								<g:if test="${s?.minilogo}">
									<g:link controller="sponsor" action="show" id="${s.id}"><img src="${createLink(action:'show',controller:'image', id:s?.minilogo?.id)}" title="${s?.encodeAsHTML()}" alt="${s?.encodeAsHTML()}"/></g:link>
								</g:if>
							</div>
						</li>
					</g:each>
				</g:if>
			</ul>
			
			<!-- Membres -->
			<ul class="span3 well sidebar-nav thumbnails">
				<dt><g:message code="group.membres.label" default="Membres" /></dt>
				<g:if test="${groupInstance?.members}">
					<g:each in="${groupInstance.members}" var="u">
						<li class="span3">
								<%/*<img src="${createLink(action:'show',controller:'image', id:s?.minilogo?.id)}" title="${s?.encodeAsHTML()}" alt="${s?.encodeAsHTML()}" class="pull-left"/>*/%>
								<img src="http://placehold.it/48x48" title="${s?.encodeAsHTML()}" alt="${s?.encodeAsHTML()}" class="sponsor-logo pull-left"/>
								<g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link>
							
						</li>
					</g:each>
				</g:if>
			</ul>
		</div>
	</body>
</html>
