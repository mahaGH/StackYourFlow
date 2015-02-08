<%@ page import="fr.isima.stackyourflow.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: '_title', 'error')} required">
	<label for="_title">
		<g:message code="default.question.attrs._title" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_title" required="" value="${tagInstance?._title}"/>

</div>

