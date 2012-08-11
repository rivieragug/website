<%@ page import="org.ughub.Sponsor" %>



<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'companyName', 'error')} ">
	<label for="companyName">
		<g:message code="sponsor.companyName.label" default="Company Name" />
		
	</label>
	<g:textField name="companyName" value="${sponsorInstance?.companyName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="sponsor.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${sponsorInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'groups', 'error')} ">
	<label for="groups">
		<g:message code="sponsor.groups.label" default="Groups" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="sponsor.logo.label" default="Logo" />
		
	</label>
	<g:textField name="logo" value="${sponsorInstance?.logo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sponsorInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="sponsor.website.label" default="Website" />
		
	</label>
	<g:textField name="website" value="${sponsorInstance?.website}" />
</div>

