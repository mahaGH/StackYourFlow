<%@ page import="fr.isima.stackyourflow.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: '_text', 'error')} required">
	<label for="_text">
		<g:message code="answer._text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_text" required="" value="${answerInstance?._text}"/>

</div>

