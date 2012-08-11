
<g:each var='sponsor' in='${sponsors}'>
	<g:link controller="sponsor" action="show" id="${sponsor.id}">
	<div class="well">
		<h3>	
			<img width="32" src='${createLink(controller: "sponsor", action: "show", id: sponsor.id)}'/>
			${sponsor.CompanyName} <small>${sponsor.description}</small>
		</h3>
	</div>
	</g:link>
</g:each>