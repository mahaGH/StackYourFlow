<%@ page import="fr.isima.authentication.User" %>


<sec:ifAllGranted roles="ROLE_ADMIN">

<g:if test="${userInstance?.username}">
	<li class="fieldcontain">
		<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>

		<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>

	</li>
</g:if>


	<g:if test="${userInstance?.password}">
		<li class="fieldcontain">
			<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>

			<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>

		</li>
	</g:if>


	<g:if test="${userInstance?.accountExpired}">
		<li class="fieldcontain">
			<span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>

			<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>

		</li>
	</g:if>

	<g:if test="${userInstance?.accountLocked}">
		<li class="fieldcontain">
			<span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>

			<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>

		</li>
	</g:if>


	<g:if test="${userInstance?.enabled}">
		<li class="fieldcontain">
			<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>

			<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>

		</li>
	</g:if>


	<g:if test="${userInstance?.email}">
		<li class="fieldcontain">
			<span id="mail-label" class="property-label"><g:message code="user.mail.label" default="Mail" /></span>

			<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${userInstance}" field="email"/></span>

		</li>
	</g:if>



	<g:if test="${userInstance?.passwordExpired}">
		<li class="fieldcontain">
			<span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>

			<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>

		</li>
	</g:if>



</sec:ifAllGranted>

<g:isOwnerOrSimpleUser owner="${userInstance}">
<g:if test="${userInstance?.nom}">
	<li class="fieldcontain">
		<span id="nom-label" class="property-label"><g:message code="user.nom.label" default="Nom" /></span>

		<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${userInstance}" field="nom"/></span>

	</li>
</g:if>

<g:if test="${userInstance?.prenom}">
	<li class="fieldcontain">
		<span id="prenom-label" class="property-label"><g:message code="user.prenom.label" default="Prenom" /></span>

		<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${userInstance}" field="prenom"/></span>

	</li>

</g:if>

<g:if test="${userInstance?.adresse}">
	<li class="fieldcontain">
		<span id="adresse-label" class="property-label"><g:message code="user.adresse.label" default="Adresse" /></span>

		<span class="property-value" aria-labelledby="adresse-label"><g:fieldValue bean="${userInstance}" field="adresse"/></span>

	</li>

</g:if>


<g:if test="${userInstance?.birth}">
	<li class="fieldcontain">
		<span id="birth-label" class="property-label"><g:message code="user.birth.label" default="Birth" /></span>

		<span class="property-value" aria-labelledby="birth-label"><g:fieldValue bean="${userInstance}" field="birth"/></span>

	</li>

</g:if>



<g:if test="${userInstance.img}">
	<img width="60.0em" height="100.0em" src="${createLink(controller:'user', action:'avatar_image', id:userInstance.id)}" />
</g:if>

</g:isOwnerOrSimpleUser>