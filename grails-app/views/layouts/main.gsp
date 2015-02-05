
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div class="Banner" role="banner"><asset:image src="renard.jpg"/>Stack Your Flow</div>


		<div class="nav" role="navigation">
			<ul>
				<li><g:link controller="question"> Questions</g:link></li>
				<li><g:link controller="tag"> Tags</g:link></li>
				<li><g:link controller="user"> Users</g:link></li>
				<li><g:link controller="question" action="unanswered"> Unanswered</g:link></li>

				<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><g:link controller="tag" action="create">New Tag</g:link></li>
				</sec:ifAllGranted>
				<g:isLogged>
					<li><g:link controller="question" action="create"> Ask Question</g:link></li>

					<!--<li><a class="home" href="${createLink(uri: '/question')}"><g:message code="default.home.label"/></a></li>-->
					<li><g:link controller="logout"> <g:message code="springSecurity.logout.title" /></g:link></li>


				</g:isLogged>
				<g:isNotLogged>
					<li><g:link controller="login"> LogIn</g:link></li>
				</g:isNotLogged>




			</ul>
		</div>
	<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
