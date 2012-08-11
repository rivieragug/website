<html>
<head>
  <meta name="layout" content="ughub-main"/>
</head>
<body>
    <g:if test="${flash.message}">
        <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
    </g:if>
	<div class="row-fluid">
        <g:form  class="form-horizontal" name="eventCreation" url="${[action:'edit',controller:'event', id: eventInstance.id]}" enctype="multipart/form-data"
       method="post"> 
            <ug:formcontrol label='Name'>
              <g:textField name='name' value="${eventInstance.name}"/>
            </ug:formcontrol>
            <ug:formcontrol label='Type'>
              <g:textField name='type' value="${eventInstance.type}"/>
            </ug:formcontrol>
            <ug:formcontrol label='Date'>
                <g:datePicker name="date" value="${eventInstance.date ?: new Date()}"
              noSelection="['':'-Choose-']"/>
            </ug:formcontrol>
            <ug:formcontrol label='Description'>
              <g:textArea name="description" style="width: 640px;" value="${eventInstance.description}" rows="40" cols="120"/>
            </ug:formcontrol>

            <div class="form-actions">
              <g:submitButton class="btn btn-primary" name="update" value="Update" />
            </div>

        </g:form>
	</div>
</body>
</html>
