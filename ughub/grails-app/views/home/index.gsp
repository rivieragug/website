<html>
<head>
  <meta name="layout" content="ughub-show"/>
</head>
<body>
	<div class="row-fluid">
    	<div class="span6">
    		<div class="hero-unit">
	      		<h1>UG-hub Home!</h1>
	      		<p>RivieraCWE is launching UG-hub tonight!</p>
			</div>
			
			<sec:ifLoggedIn>
				<h2>A passion for a niche Tech ?</h2>
				<g:link class='btn btn-large btn-primary' controller="group" action="create">
					Create My Group Now !
				</g:link> 
				<g:link class='btn btn-large btn-primary' controller="sponsor" action="create">
					Become a Sponsor Now !
				</g:link> 
			</sec:ifLoggedIn>
    	</div>

		<div class="span5">
			<h2>The Best User Groups</h2>
			<g:include controller="group" action="listShort"/>

			<h2>Upcoming Events</h2>
			<g:include controller="event" action="listShort"/>			
		</div>
	</div>
</body>
</html>