<%@ page import="fr.isima.authentication.User" %>

<sec:ifAllGranted roles="ROLE_ADMIN">

	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
		<label for="username">
			<g:message code="user.username.label" default="Username" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="username" required="" value="${userInstance?.username}"/>

	</div>


	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
		<label for="password">
			<g:message code="user.password.label" default="Password" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="password" required="" value="${userInstance?.password}"/>

	</div>


	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
		<label for="accountLocked">
			<g:message code="user.accountLocked.label" default="Account Locked" />

		</label>
		<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

	</div>


	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
		<label for="email">
			<g:message code="user.mail.label" default="Mail" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="email" required="" value="${userInstance?.email}"/>

	</div>






</sec:ifAllGranted>

<g:isOwner owner="${userInstance}">
	<input type="file" name="avatar" id="avatar"/>
</g:isOwner>

<g:isOwnerNotAdmin owner="${userInstance}">

	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'prenom', 'error')} required">
		<label for="prenom">
			<g:message code="user.prenom.label" default="Prénom" />

		</label>
		<g:textField name="prenom"  value="${userInstance?.prenom}"/>

	</div>


	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nom', 'error')} required">
		<label for="nom">
			<g:message code="user.nom.label" default="Nom" />

		</label>
		<g:textField name="nom"  value="${userInstance?.nom}"/>

	</div>



	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'adresse', 'error')} required">
		<label for="adresse">
			<g:message code="user.adresse.label" default="Adresse" />

		</label>
		<g:textField name="adresse"  value="${userInstance?.adresse}"/>

	</div>


	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'birth', 'error')} required">
		<label for="birth">
			<g:message code="user.birth.label" default="Birth" />

		</label>
		<g:datePicker name="birth"  value="${userInstance?.birth}" precision="day" />

	</div>

</g:isOwnerNotAdmin>



