<%@ page import="fr.isima.stackyourflow.Question" %>


	<div id="edit-answer" class="content scaffold-edit" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${answerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${answerInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
		</g:hasErrors>

		<g:form url="[resource:answer, action:'update']" method="PUT" >
			<g:hiddenField name="version" value="${answer?.version}" />
			<fieldset class="form">

				<div class="fieldcontain ${hasErrors(bean: answer, field: '_text', 'error')} required">
					<label for="_text">
						<g:message code="answer._text.label" default="Text" />
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="_text" required="" value="${answer?._text}"/>

				</div>

			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</fieldset>
		</g:form>

	</div>



