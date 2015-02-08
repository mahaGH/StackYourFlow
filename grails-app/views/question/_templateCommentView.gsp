<%@ page import="fr.isima.stackyourflow.Question" %>


<div class="panel panel-default">

	<div class="panel-heading">
		${message(code: 'default.head.comment' )}&nbsp;<g:link controller="user" action="show" id="${comment?.user?.id}">${comment?.user?.username}</g:link>
		${message(code: 'default.head.comment2' , args: [comment?._creationDate])}

	</div>


	<div class="panel-body" id="comment${comment.id}">




		<g:if test="${comment?._text}">


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


