<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
  <div class="well">
      <h1>Update Blog description:</h1>
      <g:message code="${flash.message}"/>
      <g:form  class="form-horizontal" name="blogUpdate" url="[action:'edit',controller:'blog']"> 
      	<ug:formcontrol label='Blog name'>
          <g:textField name="name" value="${(flash.name==null)?blogInstance.name:flash.name}"/>
        </ug:formcontrol>
        
      	<ug:formcontrol label='Blog description'>
          <g:textArea name="content" rows="20" cols="80" value="${(flash.description==null)?blogInstance.description:flash.description}"/>
        </ug:formcontrol>
        <div class="form-actions">
      	  <g:submitButton class="btn btn-primary" name="update" value="Update" />
        </div>
        <g:hiddenField name="id" value="${blogInstance.id}"/>
      </g:form>
    </div>

</body>
</html>