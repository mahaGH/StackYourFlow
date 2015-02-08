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
		<div class="User">
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					Language <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><g:link url="/StackYourFlow?lang=en">en</g:link></li>
					<li><g:link url="/StackYourFlow?lang=fr">fr</g:link></li>
				</ul>
			</div>
<g:isLogged>
	<g:currentUser/>
		<div class="Logout">
			<g:link controller="logout"> <g:message code="springSecurity.logout.title" />
			</g:link>
		</div>
	</g:isLogged>
	</div>
		<div class="Banner" role="banner"><asset:image src="renard.jpg"/>

	<div class="BannerButtons">
			<div class="nav" role="navigation">

					<li><g:link controller="question"> ${message(code: 'default.main.menu.button.questions')}</g:link></li>

			</div>
			<div class="nav" role="navigation">
						<li><g:link controller="tag"> ${message(code: 'default.main.menu.button.tags')}</g:link></li>
				</div>
			<div class="nav" role="navigation">
							<li><g:link controller="user"> ${message(code: 'default.main.menu.button.users')}</g:link></li>
			</div>
			<div class="nav" role="navigation">
								<li><g:link controller="question" action="unanswered"> ${message(code: 'default.main.menu.button.unanswered')}</g:link></li>
			</div>
			<div class="nav" role="navigation">
				<li><g:link controller="badge" action="index">${message(code: 'default.main.menu.button.badge', default: 'Score')}</g:link></li>
			</div>
<g:isLogged>
	<div class="nav" role="navigation">
		<li><g:link controller="question" action="create">${message(code: 'default.main.menu.button.ask.question')}</g:link></li>
	</div>
	</g:isLogged>

		</div>
			<div class="BannerButtons">
			<sec:ifAllGranted roles="ROLE_ADMIN">
                <div class="nav" role="navigation">
                <li><g:link controller="tag" action="create">${message(code: 'default.main.menu.button.new.Tag')}</g:link></li>
				</div>
				<div class="nav" role="navigation">
				<li><g:link controller="badge" action="create">${message(code: 'default.main.menu.button.new.Badge')}</g:link></li>
				</div>
			</sec:ifAllGranted>
				<g:isNotLogged>
				<div class="Login" role="navigation">
					<g:link controller="login">  <g:message code="${message(code: 'default.main.menu.button.login')}" /></g:link>
				</div>
				</g:isNotLogged></div>
					<g:isLogged>
						<div class="Login" role="navigation">
							<g:link controller="logout"> <g:message code="${message(code: 'default.main.menu.button.logout')}" /></g:link>
						</div>

					</g:isLogged>

		</div>
	<g:layoutBody/>


	</body>
</html>
