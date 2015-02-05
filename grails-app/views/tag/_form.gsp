<%@ page import="fr.isima.stackyourflow.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: '_title', 'error')} required">
	<label for="_title">
		<g:message code="tag._title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_title" required="" value="${tagInstance?._title}"/>

</div>

