
<g:each var='group' in='${groups}'>
	<g:link controller="group" action="show" id="${group.id}">
	<div class="well">
		<h3>	
			<img width="32" src='${createLink(controller: "image", action: "show", id: group.minilogo?.id)}'/>
			${group.name} <small>${group.description}</small>
		</h3>
	</div>
	</g:link>
</g:each>