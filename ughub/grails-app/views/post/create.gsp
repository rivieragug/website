<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <div class="well">
      <h1>Post an entry in Blog:</h1>
      <g:message code="${flash.message}"/>
      <g:form  class="form-horizontal" name="postCreation" url="[action:'save',controller:'post']"> 
      	<ug:formcontrol label='Post title'>
          <g:textField name="title" value="${(flash.title==null)?'':flash.title}"/>
        </ug:formcontrol>
        
      	<ug:formcontrol label='Post content'>
          <g:textArea name="content" rows="20" cols="80" value="${(flash.content==null)?'':flash.comment}"/>
        </ug:formcontrol>
        <div class="form-actions">
      	  <g:submitButton class="btn btn-primary" name="create" value="Create" />
        </div>
        <g:hiddenField name="blog.id" value="${blog.id}"/>
      </g:form>
    </div>
</body>
</html>