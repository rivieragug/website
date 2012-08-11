
<g:each var='event' in='${events}'>
	<g:link controller="event" action="show" id="${event.id}">
	<div class="well">
		<h3>	
			${event.name} <small>${event.type}</small>
		</h3>
	</div>
	</g:link>
</g:each>