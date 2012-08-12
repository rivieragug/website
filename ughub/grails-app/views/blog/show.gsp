<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <h1>${blogInstance.name}</h1>
    <h2>${blogInstance.description}</h2>
    Posts:<br/>
    <g:each in="${blogInstance.posts}">
    <textArea name="comment">${it.postContent}</textArea><br/>
    By ${it.author.firstName} ${it.author.lastName} at ${it.commentDate}<br/>
    =================================== <br/>
    </g:each>
</body>
</html>
