<%@ page import="fr.isima.stackyourflow.Badge" %>



<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: '_name', 'error')} required">
	<label for="_name">
		<g:message code="badge._name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_name" required="" value="${badgeInstance?._name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: '_objective', 'error')} required">
	<label for="_objective">
		<g:message code="badge._objective.label" default="Objective" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_objective" required="" value="${badgeInstance?._objective}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: badgeInstance, field: '_toReach', 'error')} required">
	<label for="_toReach">
		<g:message code="badge._toReach.label" default="To Reach" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="_toReach" type="number" value="${badgeInstance._toReach}" required=""/>

</div>

