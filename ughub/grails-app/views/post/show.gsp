<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <h1>${postInstance.referenceBlog.name}</h1>
    <h2>${postInstance.title}</h2>
    <textArea cols='20' name="content" readonly="true">${postInstance.postContent}"</textArea>
    <br />
    From ${postInstance.author.firstName} ${postInstance.author.lastName} at ${postInstance.postDate}(Last Modif: ${postInstance.lastUpdateDate})<br/>
    <br/>Comments:<br/>
    <g:each in="${postInstance.comments}">
   <textArea name="comment">${it.comment}</textArea><br/>
    By ${it.author.firstName} ${it.author.lastName} at ${it.commentDate}<br/>
    =================================== <br/>
    </g:each>
    <br/>
    Add a new comment:
     <g:form  class="form-horizontal" name="postCreation" url="[action:'save',controller:'postComment']"> 
      	<ug:formcontrol label='comment'>
          <g:textArea name="comment" rows="20" cols="80" value="${(flash.comment==null)?'':flash.comment}"/>
        </ug:formcontrol>
        <div class="form-actions">
      	  <g:submitButton class="btn btn-primary" name="create" value="Create" />
        </div>
        <g:hiddenField name="post.id" value="${postInstance.id}"/>
      </g:form>
</body>
</html>
