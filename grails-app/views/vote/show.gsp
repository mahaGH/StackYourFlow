
<%@ page import="fr.isima.stackyourflow.Vote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vote.label', default: 'Vote')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vote" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vote">
			
				<g:if test="${voteInstance?.refTo}">
				<li class="fieldcontain">
					<span id="refTo-label" class="property-label"><g:message code="vote.refTo.label" default="Ref To" /></span>
					
						<span class="property-value" aria-labelledby="refTo-label"><g:link controller="post" action="show" id="${voteInstance?.refTo?.id}">${voteInstance?.refTo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${voteInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="vote.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${voteInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${voteInstance?.voter}">
				<li class="fieldcontain">
					<span id="voter-label" class="property-label"><g:message code="vote.voter.label" default="Voter" /></span>
					
						<span class="property-value" aria-labelledby="voter-label"><g:link controller="user" action="show" id="${voteInstance?.voter?.id}">${voteInstance?.voter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:voteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${voteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
