<%@ page import="fr.isima.authentication.User" %>


<sec:ifAllGranted roles="ROLE_ADMIN">

<g:if test="${userInstance?.username}">
	<li class="fieldcontain">
		<span id="username-label" class="property-label"><g:message code="default.utilisateur.attrs.username" default="Username" /></span>

		<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>

	</li>
</g:if>


	<g:if test="${userInstance?.password}">
		<li class="fieldcontain">
			<span id="password-label" class="property-label"><g:message code="default.utilisateur.attrs.password" default="Password" /></span>

			<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>

		</li>
	</g:if>


	<g:if test="${userInstance?.accountExpired}">
		<li class="fieldcontain">
			<span id="accountExpired-label" class="property-label"><g:message code="default.utilisateur.attrs.accountExpire" default="Account Expired" /></span>

			<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>

		</li>
	</g:if>

	<g:if test="${userInstance?.accountLocked}">
		<li class="fieldcontain">
			<span id="accountLocked-label" class="property-label"><g:message code="default.utilisateur.attrs.accountLock" default="Account Locked" /></span>

			<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>

		</li>
	</g:if>


	<g:if test="${userInstance?.enabled}">
		<li class="fieldcontain">
			<span id="enabled-label" class="property-label"><g:message code="default.utilisateur.attrs.enabled" default="Enabled" /></span>

			<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>

		</li>
	</g:if>


	<g:if test="${userInstance?.email}">
		<li class="fieldcontain">
			<span id="mail-label" class="property-label"><g:message code="default.utilisateur.attrs.email" default="Mail" /></span>

			<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${userInstance}" field="email"/></span>

		</li>
	</g:if>



	<g:if test="${userInstance?.passwordExpired}">
		<li class="fieldcontain">
			<span id="passwordExpired-label" class="property-label"><g:message code="default.utilisateur.attrs.accountExpire" default="Password Expired" /></span>

			<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>

		</li>
	</g:if>



</sec:ifAllGranted>

<g:isOwnerOrSimpleUser owner="${userInstance}">
<g:if test="${userInstance?.nom}">
	<li class="fieldcontain">
		<span id="nom-label" class="property-label"><g:message code="default.utilisateur.attrs.nom" default="Nom" /></span>

		<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${userInstance}" field="nom"/></span>

	</li>
</g:if>

<g:if test="${userInstance?.prenom}">
	<li class="fieldcontain">
		<span id="prenom-label" class="property-label"><g:message code="default.utilisateur.attrs.prenom" default="Prenom" /></span>

		<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${userInstance}" field="prenom"/></span>

	</li>

</g:if>

<g:if test="${userInstance?.adresse}">
	<li class="fieldcontain">
		<span id="adresse-label" class="property-label"><g:message code="default.utilisateur.attrs.adresse" default="Adresse" /></span>

		<span class="property-value" aria-labelledby="adresse-label"><g:fieldValue bean="${userInstance}" field="adresse"/></span>

	</li>

</g:if>


<g:if test="${userInstance?.birth}">
	<li class="fieldcontain">
		<span id="birth-label" class="property-label"><g:message code="default.utilisateur.attrs.birth" default="Birth" /></span>

		<span class="property-value" aria-labelledby="birth-label"><g:fieldValue bean="${userInstance}" field="birth"/></span>

	</li>

</g:if>



<g:if test="${userInstance.img}">
	<img width="60.0em" height="100.0em" src="${createLink(controller:'user', action:'avatar_image', id:userInstance.id)}" />
</g:if>

<g:if test="${userInstance?.badges}">
	<li class="fieldcontain">

		<g:each in="${userInstance.badges}" var="u">
			<span class="label label-info" aria-labelledby="users-label"><g:link controller="badge" action="show" id="${u.id}">${u._name}</g:link></span>
		</g:each>

	</li>
</g:if>
</g:isOwnerOrSimpleUser>


<table>
	<thead>
	<tr>

		<g:sortableColumn property="message" title="${message( code: 'default.attrs.date',default: 'date' )}" />
		<g:sortableColumn property="date" title="${message( code: 'default.question.attrs.Text',default: 'text' )}" />
		<g:sortableColumn property="type" title="${message( code: 'default.question.attrs.Type',default: 'type' )}" />


	</tr>
	</thead>
	<tbody>
	<g:each in="${userInstance.posts}" status="i" var="post">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

			<td><g:link controller="question" action="show" id="${post.whoIsMyMaster()}"><g:formatDate format="yyyy-MM-dd" date="${post._creationDate}"/></g:link></td>


				<td>${fieldValue(bean: post, field: "_text" )}</td>

			<td>${post.whoIsMyController()}</td>





		</tr>
	</g:each>
	</tbody>
</table>