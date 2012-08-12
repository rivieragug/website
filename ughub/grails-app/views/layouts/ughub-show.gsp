<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="UGhub" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<r:require modules="ughub" />
<r:require modules="bootstrap" />
<g:layoutHead />
<r:layoutResources />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
</head>
<body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<sec:ifLoggedIn>
					<ul class="nav">
	        	<li><g:link controller="home"><i class="icon-home icon-white"></i></g:link></li>
	        </ul>
					<a class="brand" href="${g.createLink(controller: "home")}">UG-hub Home!</a>
					<div class="btn-group pull-right">
						<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
							<i class="icon-user"></i>&nbsp;<ug:currentUser prop="firstName"/> <ug:currentUser prop="lastName"/> 
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="${g.createLink(controller: "user", action:"show")}">Profile</a></li>
							<li class="divider"></li>
							<li><g:link controller='logout'>Sign out</g:link></li>
						</ul>
					</div>
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<a class="brand" href="#">Welcome</a>
					<div class="btn-group pull-right">
						<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
							<i class="icon-user"></i> <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><g:link controller='user'>Login</g:link></li>
							<li class="divider"></li>
							<li><g:link controller='user' action='create'>Register</g:link></li>
						</ul>
					</div>
				</sec:ifNotLoggedIn>

				<div class="nav-collapse">
					<ul class="nav">
						<!--<li class="active"><a href="#">Home</a></li>-->
						<li><a href="#about">About</a></li>
						<li><a href="#contact">Contact</a></li>
						<!--li><a href="#contact">Admin</a></li-->
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span1"></div>
		<div class="span10">
			<g:layoutBody />
		</div>
		<div class="span1"></div>
	</div>

	<r:layoutResources />
</body>
</html>
