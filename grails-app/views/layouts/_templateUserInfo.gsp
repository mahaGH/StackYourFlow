<%@ page import="fr.isima.authentication.User" %>


<g:if test="${userInstance?.username}">
	<li class="fieldcontain">
		<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>

		<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>

	</li>
</g:if>

<li class="fieldcontain">
	<span id="score-label" class="property-label"><g:message code="user.score.label" default="Score" /></span>

	<span class="property-value" aria-labelledby="score-label"><g:fieldValue bean="${userInstance}" field="score"/></span>

</li>

<g:if test="${userInstance.img}">
	<img width="60.0em" height="100.0em" src="${createLink(controller:'user', action:'avatar_image', id:userInstance.id)}" />
</g:if>

