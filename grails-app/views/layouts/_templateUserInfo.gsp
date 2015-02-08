<%@ page import="fr.isima.authentication.User" %>

<div class="UserInfo">

<g:if test="${userInstance?.username}">
	<g:link class="Userlabel" controller="user" action="show" id="${userInstance.id}">
		<g:fieldValue bean="${userInstance}" field="username"/></span>
	</g:link>
</g:if>
<g:if test="${userInstance.img}">
	<img class="littleAvatar" width="30.0em" height="30.0em" src="${createLink(controller:'user', action:'avatar_image', id:userInstance.id)}" />
</g:if>
</div>


