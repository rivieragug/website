<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <div class="well">
      <h1>Post a comment</h1>
      <g:message code="${flash.message}"/>
      <g:form  class="form-horizontal" name="postCreation" url="[action:'save',controller:'postComment']"> 
      	<ug:formcontrol label='comment'>
          <g:textArea name="comment" rows="20" cols="80" value="${(flash.comment==null)?'':flash.comment}"/>
        </ug:formcontrol>
        <div class="form-actions">
      	  <g:submitButton class="btn btn-primary" name="create" value="Create" />
        </div>
        <g:hiddenField name="post.id" value="${post.id}"/>
      </g:form>
    </div>
</body>
</html>