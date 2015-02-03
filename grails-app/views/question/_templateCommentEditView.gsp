<%@ page import="fr.isima.stackyourflow.Question" %>

<g:form url="[resource:comment, action:'update']" method="PUT" >
	<g:hiddenField name="version" value="${comment?.version}" />
	<fieldset class="form">
		<g:render template="/comment/form" model="[commentInstance:comment]"/>
	</fieldset>
	<fieldset class="buttons">
		<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
	</fieldset>
</g:form>