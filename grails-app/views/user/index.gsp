
<%@ page import="fr.isima.authentication.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />

						<sec:ifAllGranted roles="ROLE_ADMIN">
						<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'user.mail.label', default: 'Mail')}" />

						</sec:ifAllGranted>

						<sec:ifNotGranted roles="ROLE_ADMIN">

							<g:sortableColumn property="nom" title="${message(code: 'user.nom.label', default: 'Nom')}" />

							<g:sortableColumn property="prenom" title="${message(code: 'user.prenom.label', default: 'Prenom')}" />
							<g:sortableColumn property="score" title="${message(code: 'user.score.label', default: 'Score')}" />



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
