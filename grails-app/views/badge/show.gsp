
<%@ page import="fr.isima.stackyourflow.Badge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'badge.label', default: 'Badge')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-badge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="show-badge" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${badgeInstance?._name}">
				<li class="fieldcontain">
					<span id="_name-label" class="property-label"><g:message code="badge._name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="_name-label"><g:fieldValue bean="${badgeInstance}" field="_name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${badgeInstance?._objective}">
				<li class="fieldcontain">
					<span id="_objective-label" class="property-label"><g:message code="badge._objective.label" default="Objective" /></span>
					
						<span class="property-value" aria-labelledby="_objective-label"><g:fieldValue bean="${badgeInstance}" field="_objective"/></span>
					
				</li>
				</g:if>

<g:if test="${badgeInstance?.image}">
	<asset:image src="${badgeInstance.image}"/>
</g:if>

				<table>
					<thead>
					<tr>

						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />



							<g:sortableColumn property="nom" title="${message(code: 'user.nom.label', default: 'Nom')}" />

							<g:sortableColumn property="prenom" title="${message(code: 'user.prenom.label', default: 'Prenom')}" />
							<g:sortableColumn property="score" title="${message(code: 'user.score.label', default: 'Score')}" />




					</tr>
					</thead>
					<tbody>
					<g:each in="${badgeInstance.users}" status="i" var="userInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>

									<g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link>

							</td>


								<td>${fieldValue(bean: userInstance, field: "nom")}</td>

								<td>${fieldValue(bean: userInstance, field: "prenom")}</td>

								<td>${fieldValue(bean: userInstance, field: "score")}</td>

						</tr>
					</g:each>
					</tbody>
				</table>
			
			</ol>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:form url="[resource:badgeInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${badgeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAllGranted>

		</div>
	</body>
</html>
