<html>
<head>
  <meta name="layout" content="ughub-show"/>
</head>
<body>
    <div class="row-fluid">
        <div class="span7 content">
            <!-- Event header -->
            <div class="page-header">
                <sec:ifLoggedIn>
                    <g:form class="pull-right">
                        <g:hiddenField name="id" value="${eventInstance?.id}" />
                        <div>
                            <g:link class="btn" action="edit" id="${eventInstance?.id}">
                                <i class="icon-pencil"></i>
                                <g:message code="default.button.edit.label" default="Edit" />
                            </g:link>
                            <button class="btn btn-danger" type="submit" name="_action_delete">
                                <i class="icon-trash icon-white"></i>
                                <g:message code="default.button.delete.label" default="Delete" />
                            </button>
                        </div>
                    </g:form>
                </sec:ifLoggedIn>
                <h1><g:if test="${eventInstance?.name}"><g:fieldValue bean="${eventInstance}" field="name"/></g:if>
                    <small>${eventInstance.type}</small>
                </h1>
                <h2>${eventInstance.date}</h2>
                <hr>
                <markdown:renderHtml>${eventInstance.description}</markdown:renderHtml>
            </div>
        </div>
       
    </div>

</body>
</html>