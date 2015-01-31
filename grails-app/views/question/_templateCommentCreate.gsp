<%@ page import="fr.isima.stackyourflow.Question" %>


<g:form url="[ action:'saveComment', controller:'question']" >
	<fieldset class="form">
		<g:render template="/comment/form"/>
	</fieldset>
	<fieldset class="buttons">
		<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	</fieldset>
</g:form>



