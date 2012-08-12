<%@ page import="org.ughub.Sponsor" %>
<%@ page import="org.ughub.Group" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-show">
		<g:set var="entityName" value="${message(code: 'sponsor.label', default: 'Sponsor')}" />
		<title><g:message code="default.create.sponsor" args="[entityName]" /></title>
		
		
		<script type="text/javascript">

		$("#selectgroup").bind("change",function(){
	alert ("coucou");		
//		    $("div#payment img:first").attr('src', images[$("select :selected").val()] );
//		    $("div#payment img").show();
		});

		$('"#selectgroup"').click(function() {
			alert ("blah");		
			});
		
		</script>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span2 ">
			<div class="well sidebar-nav">
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
			    <div>
            		<img src="../images/RivieraGUG-mascot.png">
          		</div>
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
                <div class="span4">
				<fieldset>
					<g:form class="form-horizontal" action="create" >
						<fieldset>
							<!--f:all bean="sponsorInstance"/-->
					      	<ug:formcontrol label='Your organization'>
					          <g:textField name="companyName" value="${sponsorInstance.companyName}"/>
					        </ug:formcontrol>
					        <ug:formcontrol label='Tell us about you'>
					          <g:textArea name="description" style="height: 200px;" value="${sponsorInstance.description}"/>
					        </ug:formcontrol>
					        <ug:formcontrol label='Your website'>
					          <g:textField type="url" name="website" value="${sponsorInstance.website}"/>
					        </ug:formcontrol>      
					        <ug:formcontrol label='Which groups are you interested in'>
							<g:select id="selectgroup" name="group.id"
					          from="${Group.list()}"
					          value=""
					          optionKey="name" multiple="" />
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
                <div class="span4 nav" style="float:right">
                <h2>Raise Your Brand Awareness</h2>
                <h3>Sophia Antipolis based, Get involved</h3>
                <br/>
                <p>If like us you want French Riviera, Sophia Antipolis</p>
<p>Our contributors are active as speakers on the technical IT conferences and forums.
Enter into lively debates on several different media. 
We are building up a Collaborative User Group platform (UgHub) to federate all Rivuera User Group.
Be one of the first to help use site for up-to-date news on best practice ideas, new technologies and advice - offering them a platform for their voice and opinion.</p>

<p>Be the first one means that you can tap into that environment and add the weight of your name and brand to a well respected IT social network
offers something different in the IT field, a channel direct to the heart of IT professionals. </p>

<p>If you believe in your brand and your product and want to promote it to a IT geek audience, forming an alliance with us should be an essential part of your business development plan.

We have a range of sponsorship opportunities available to suit a variety of budgets.</p>. 
                </div>
		</div>
</div>
	</body>
</html>
