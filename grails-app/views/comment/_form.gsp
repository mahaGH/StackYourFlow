<%@ page import="fr.isima.stackyourflow.Comment" %>


<div class="fieldcontain ${hasErrors(bean: commentInstance, field: '_text', 'error')} required">
	<label for="_text">
		<g:message code="comment._text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_text" required="" value="${commentInstance?._text}"/>

</div>

