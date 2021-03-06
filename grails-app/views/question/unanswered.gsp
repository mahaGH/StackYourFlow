
<%@ page import="fr.isima.stackyourflow.Question" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'default.show.questions', default: 'Question')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="list-question" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
		<tr>


			<th><g:message code="default.question.attrs._title" default="Title" /></th>

			<g:sortableColumn property="_score" title="${message(code: 'default.question.attrs.score', default: 'Score')}" />

			<g:sortableColumn property="_text" title="${message(code: 'default.question.attrs.Text', default: 'Text')}" />

			<g:sortableColumn property="user" title="${message(code: 'default.question.attrs.user', default: 'User')}" />

		</tr>
		</thead>
		<tbody>
		<g:each in="${questionInstanceList}" status="i" var="questionInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "_title")}</g:link></td>

				<td>${fieldValue(bean: questionInstance, field: "_score")}</td>

				<td>${fieldValue(bean: questionInstance, field: "_text")}</td>

				<td>${questionInstance.user.username}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${questionInstanceCount ?: 0}" />
	</div>
</div>
</body>
</html>
