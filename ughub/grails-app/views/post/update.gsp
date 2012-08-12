<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
  <div class="well">
      <h1>Update an entry in Blog:</h1>
      <g:message code="${flash.message}"/>
      <g:form  class="form-horizontal" name="postCreation" url="[action:'edit',controller:'post']"> 
      	<ug:formcontrol label='Post title'>
          <g:textField name="title" value="${(flash.title==null)?postInstance.title:flash.title}"/>
        </ug:formcontrol>
        
      	<ug:formcontrol label='Post content'>
          <g:textArea name="content" rows="20" cols="80" value="${(flash.content==null)?postInstance.postContent:flash.comment}"/>
        </ug:formcontrol>
        <div class="form-actions">
      	  <g:submitButton class="btn btn-primary" name="update" value="Update" />
        </div>
        <g:hiddenField name="id" value="${postInstance.id}"/>
      </g:form>
    </div>

</body>
</html>