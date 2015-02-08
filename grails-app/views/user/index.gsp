
<%@ page import="fr.isima.authentication.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'default.main.menu.button.users')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'default.utilisateur.attrs.username', default: 'Username')}" />

						<sec:ifAllGranted roles="ROLE_ADMIN">
						<g:sortableColumn property="password" title="${message(code: 'default.utilisateur.attrs.password', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'default.utilisateur.attrs.accountExpire', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'default.utilisateur.attrs.accountLock', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'default.utilisateur.attrs.enabled', default: 'Enabled')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'default.utilisateur.attrs.email', default: 'Mail')}" />

						</sec:ifAllGranted>

						<sec:ifNotGranted roles="ROLE_ADMIN">

							<g:sortableColumn property="nom" title="${message(code: 'default.utilisateur.attrs.nom', default: 'Nom')}" />

							<g:sortableColumn property="prenom" title="${message(code: 'default.utilisateur.attrs.prenom', default: 'Prenom')}" />
							<g:sortableColumn property="score" title="${message(code: 'default.question.attrs.score', default: 'Score')}" />



						</sec:ifNotGranted>
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

						<sec:ifAllGranted roles="ROLE_ADMIN">
						<td>${fieldValue(bean: userInstance, field: "password")}</td>

						<td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>
					
						<td>${fieldValue(bean: userInstance, field: "email")}</td>
						</sec:ifAllGranted>

						<sec:ifNotGranted roles="ROLE_ADMIN">

							<td>${fieldValue(bean: userInstance, field: "nom")}</td>

							<td>${fieldValue(bean: userInstance, field: "prenom")}</td>

							<td>${fieldValue(bean: userInstance, field: "score")}</td>



						</sec:ifNotGranted>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
