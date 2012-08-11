<%@ page import="org.ughub.Sponsor" %>
<%@ page import="org.ughub.Group" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-show">
		<g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
		<title><g:message code="default.create.sponsor" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span2 well sidebar-nav">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li class="active">
							<g:link class="create" action="create">
								<i class="icon-plus icon-white"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
			</div>
			
			<div class="span8 content">

				<div class="page-header">
					<h1><g:message code="default.create.sponsor" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${sponsorInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${sponsorInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="create" >
						<fieldset>
							<!--f:all bean="sponsorInstance"/-->
					      	<ug:formcontrol label='Your organization'>
					          <g:textField name="companyName" value="${sponsorInstance.companyName}"/>
					        </ug:formcontrol>
					        <ug:formcontrol label='Tell us about you'>
					          <g:textArea name="description" value="${sponsorInstance.description}"/>
					        </ug:formcontrol>
					        <ug:formcontrol label='Your website'>
					          <g:textField type="url" name="website" value="${sponsorInstance.website}"/>
					        </ug:formcontrol>      
					        <ug:formcontrol label='Which groups are you interested in'>
							<g:select name="group.id"
					          from="${Group.list()}"
					          value=""
					          optionKey="name" />
					        </ug:formcontrol> 
					          
						    <g:textField name="comauto" style="width: 300px;"> </g:textField>
						
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.create.label" default="Create" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

				
			</div>

		</div>

	</body>
</html>
