
<%@ page import="fr.isima.stackyourflow.Comment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-comment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comment">
			
				<g:if test="${commentInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="comment.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${commentInstance?.user?.id}">${commentInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentInstance?.refTo}">
				<li class="fieldcontain">
					<span id="refTo-label" class="property-label"><g:message code="comment.refTo.label" default="Ref To" /></span>
					
						<span class="property-value" aria-labelledby="refTo-label"><g:link controller="post" action="show" id="${commentInstance?.refTo?.id}">${commentInstance?.refTo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentInstance?._creationDate}">
				<li class="fieldcontain">
					<span id="_creationDate-label" class="property-label"><g:message code="comment._creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="_creationDate-label"><g:formatDate date="${commentInstance?._creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentInstance?._text}">
				<li class="fieldcontain">
					<span id="_text-label" class="property-label"><g:message code="comment._text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="_text-label"><g:fieldValue bean="${commentInstance}" field="_text"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:commentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${commentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
