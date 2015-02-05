
<%@ page import="fr.isima.stackyourflow.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-tag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tag">
			
				<g:if test="${tagInstance?._title}">
				<li class="fieldcontain">
					<span id="_title-label" class="property-label"><g:message code="tag._title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="_title-label"><g:fieldValue bean="${tagInstance}" field="_title"/></span>
					
				</li>
				</g:if>


				<g:if test="${tagInstance?.questions}">



					<table>
						<thead>
						<tr>

							<th><g:message code="question._title.label" default="Title" /></th>

							<g:sortableColumn property="_score" title="${message(code: 'question._score.label', default: 'Score')}" />


							<g:sortableColumn property="user" title="${message(code: 'question.user.label', default: 'User')}" />



						</tr>
						</thead>
						<tbody>
						<g:each in="${tagInstance?.questions}" status="i" var="questionInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "_title")}</g:link></td>

								<td>${fieldValue(bean: questionInstance, field: "_score")}</td>


								<td>${questionInstance.user.username}</td>


							</tr>
						</g:each>
						</tbody>
					</table>


				</g:if>
			
			</ol>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:form url="[resource:tagInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${tagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</sec:ifAllGranted>
		</div>
	</body>
</html>
