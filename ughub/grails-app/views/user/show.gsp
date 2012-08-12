
<%@ page import="org.ughub.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="ughub-show">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:fieldValue bean="${userInstance}" field="firstName"/> 
            <g:fieldValue bean="${userInstance}" field="lastName"/></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<div class="page-header">
					<h1>
            <g:fieldValue bean="${userInstance}" field="firstName"/> 
            <g:fieldValue bean="${userInstance}" field="lastName"/>
          </h1>
				</div>
      </div>
    </div>

    <div class="row-fluid">
			<g:if test="${flash.message}">
			 <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
			</g:if>
      
      <div class="span6">

        <g:form action="save" name="profileForm" class="form-horizontal well">
          <legend>Profile</legend>
          <fieldset>
            <div class="control-group">
              <label for="" class="control-label"><g:message code="user.username.label" default="Email address" /></label>
              <div class="controls">
                <ug:isProfileOwner userId="${userInstance.id}">
                  <input type="text" class="input-xlarge" name="username" disabled value="${userInstance.username}">
                </ug:isProfileOwner>
                <ug:isNotProfileOwner userId="${userInstance.id}">
                  <span>${userInstance.username}</span>
                </ug:isNotProfileOwner>
              </div>
            </div>
            <div class="control-group">
              <label for="" class="control-label"><g:message code="user.firstName.label" default="First Name" /></label>
              <div class="controls">
                <ug:isProfileOwner userId="${userInstance.id}">
                  <input type="text" class="input-xlarge" name="firstName" value="${userInstance.firstName}">
                </ug:isProfileOwner>
                <ug:isNotProfileOwner userId="${userInstance.id}">
                  <span>${userInstance.firstName}</span>
                </ug:isNotProfileOwner>
              </div>
            </div>
            <div class="control-group">
              <label for="" class="control-label"><g:message code="user.lastName.label" default="Last Name" /></label>
              <div class="controls">
                <ug:isProfileOwner userId="${userInstance.id}">
                  <input type="text" class="input-xlarge" name="lastName" value="${userInstance.lastName}">
                </ug:isProfileOwner>
                <ug:isNotProfileOwner userId="${userInstance.id}">
                  <span>${userInstance.lastName}</span>
                </ug:isNotProfileOwner>
              </div>
            </div>
          </fieldset>
          <ug:isProfileOwner userId="${userInstance.id}">
          <fieldset>
            <g:hiddenField name="id" value="${userInstance?.id}" />
            <div class="form-actions">
              <a class="btn" name="saveBtn" disabled id="saveBtn">
                <i class="icon-ok icon-white"></i>
                <g:message code="default.button.save-profile.label" default="Save" />
              </a>
            </div>
          </fieldset>
          </ug:isProfileOwner>
        </g:form>
      </div>
      <div class="span6">
        <div class="well">
          <fieldset>
            <legend>Groups</legend>

            <g:if test="${userInstance?.groups}">
              <ul>
                <g:each in="${userInstance.groups}" var="g">
                <li>
                  <g:link controller="group" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link>
                </li>
                </g:each> 
              </ul>
            </g:if>   
            <g:else>
              <p>
                <g:message code="user.no-groups.label" default="You don't belong to any group" />
              </p>
              <p>
                <g:link class="btn btn-primary" controller="group" action="list">
                  <i class="icon-chevron-right icon-white"></i>
                  <g:message code="default.button.find-group.label" default="Go find one!" />
                </g:link>
              </p>
            </g:else>       
          </fieldset>
        </div>
      </div>
    </div>

    <r:script>
    ;(function(){

      var inputs;

      function getFormData(form) {

          var data = [];
          inputs = inputs || $('input', form);

          inputs.each(function(){
            var i = $(this);
            data[i.attr('name')] = i.val()
          });
          return data;  
      }

      function updatedForm(form, oldData) {

        var data = getFormData(form);
        for(var key in data){
          if (data[key] !== oldData[key]){
            return true;
          }
        }
        return false;
      }

      $(function(){
          var form, saveBtn, initialData, formEnabled;

          form = $('#profileForm');
          initialData = [];
          formEnabled = false;
          saveBtn = $('#saveBtn').click(function(){
              form.submit();
          });

          initialData = getFormData(form);
          inputs.change(function(){
              if( formEnabled = updatedForm(form, initialData) ) {
              console.log('modified', saveBtn)
                saveBtn.removeAttr('disabled').addClass('btn-success');
              }
              else {
              console.log('unchanged')
                saveBtn.attr('disabled', 'disabled').removeClass('btn-success');
              }
          });

          form.submit(function() {
            if (!formEnabled) {
              return false;
            }
          });


          console.log('form data', initialData);
      });
    })();
    </r:script>
	</body>
</html>
