
<%@ page import="fr.isima.stackyourflow.Badge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'default.badge.attrs.badges', default: 'Badge')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-badge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-badge" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="image" title="${message(code: 'default.badge.attrs.image', default: 'Image')}" />


						<g:sortableColumn property="_name" title="${message(code: 'default.badge.attrs.nom', default: 'Name')}" />
					
						<g:sortableColumn property="_objective" title="${message(code: 'default.badge.attrs.objective', default: 'Objective')}" />
					

						<g:isLogged>
							<g:sortableColumn property="progress" title="${message(code: 'default.badge.attrs.progress', default: 'Progress')}" />

						</g:isLogged>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${badgeInstanceList}" status="i" var="badgeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>
							<g:if test="${badgeInstance?.image}">
								<asset:image src="${badgeInstance.image}"/>
							</g:if>
							 </td>

						<td><g:link action="show" id="${badgeInstance.id}">${fieldValue(bean: badgeInstance, field: "_name")}</g:link></td>
					
						<td>${fieldValue(bean: badgeInstance, field: "_objective")}</td>

						<td>
						<g:isLogged>
							<g:progressBar badge="${badgeInstance}"/>
						</g:isLogged>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${badgeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
