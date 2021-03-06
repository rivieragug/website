<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="UGhub"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <r:require modules="bootstrap"/>
    <g:layoutHead/>
    <r:layoutResources />
  </head>
  <body>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#"> UG-hub Home!</a>
          <ul class="nav">
            <li><g:link controller="home"><i class="icon-home icon-white"></i></g:link></li>
          </ul>
          <ul class="nav pull-right">
            
              <sec:ifLoggedIn>
                <li class='active'><a href="${g.createLink(controller: "user", action:"show")}"><ug:currentUser prop="firstName"/> <ug:currentUser prop="lastName"/></a></li>
                <li>
                  <g:link controller='logout'>Logout</g:link>
                </li>
              </sec:ifLoggedIn>
              <sec:ifNotLoggedIn>
                <li>
                  <g:link controller='user' action='create'>Register</g:link>
                </li> 
                <li>
                  <g:link controller='user'>Login</g:link>
                </li> 
              </sec:ifNotLoggedIn>
          </ul>
        </div>
      </div>
    </div>  

    <div class="row-fluid">
      <div class="span1"></div>
      <div class="span10">
        <g:layoutBody/>
      </div>
      <div class="span1"></div>
    </div>

    <r:layoutResources />
  </body>
</html> 