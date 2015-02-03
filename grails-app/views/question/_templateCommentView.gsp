<%@ page import="fr.isima.stackyourflow.Question" %>


<div class="panel panel-default">

	<div class="panel-body" id="comment${comment.id}">

		<g:if test="${comment?.user}">

				<span id="user-label" class="property-label"><g:message code="comment.user.label" default="User" /></span>

				<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${comment?.user?.id}">${comment?.user?.username}</g:link></span>


		</g:if>

		<g:if test="${comment?._creationDate}">

				<span id="_creationDate-label" class="property-label"><g:message code="comment._creationDate.label" default="Creation Date" /></span>

				<span class="property-value" aria-labelledby="_creationDate-label"><g:formatDate date="${comment?._creationDate}" /></span>


		</g:if>

		<g:if test="${comment?._text}">

				<span id="_text-label" class="property-label"><g:message code="comment._text.label" default="Text" /></span>

				<span class="property-value" aria-labelledby="_text-label"><g:fieldValue bean="${comment}" field="_text"/></span>


		</g:if>

		<g:isOwner owner="${comment.user}">
			<g:form url="[resource:comment, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:remoteLink class="edit" action="editComment" id="${comment.id}" update="comment${comment.id}"><g:message code="default.button.edit.label" default="Edit" /></g:remoteLink>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</g:isOwner>


	</div>
</div>


