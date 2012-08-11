<%@page import="org.ughub.Group"%>

<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <div class="well">
      <h1>Create a new Blog:</h1>
      <g:message code="${flash.message}"/>
      <g:form  class="form-horizontal" name="blogCreation" url="[action:'save',controller:'blog']"> 
      	<ug:formcontrol label='Blog name'>
          <g:textField name="name" value="${(flash.name==null)?'':flash.name}"/>
        </ug:formcontrol>
        
      	<ug:formcontrol label='Blog description'>
          <g:textArea name="description" rows="20" cols="80" value="${(flash.description==null)?'':flash.description}"/>
        </ug:formcontrol>
        <div class="form-actions">
      	  <g:submitButton class="btn btn-primary" name="create" value="Create" />
        </div>
            <g:select name="group.id" from="${Group.findAll()}" />
      </g:form>
    </div>
</body>
</html>