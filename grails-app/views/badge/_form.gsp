<%@ page import="fr.isima.stackyourflow.Badge" %>



<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: '_name', 'error')} required">
	<label for="_name">
		<g:message code="default.badge.attrs.nom" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_name" required="" value="${badgeInstance?._name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: '_objective', 'error')} required">
	<label for="_objective">
		<g:message code="default.badge.attrs.objective" default="Objective" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_objective" required="" value="${badgeInstance?._objective}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: '_toReach', 'error')} required">
	<label for="_toReach">
		<g:message code="default.badge.attrs.toReach" default="To Reach" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="_toReach" type="number" value="${badgeInstance._toReach}" required=""/>

</div>

