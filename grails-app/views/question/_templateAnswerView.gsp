<%@ page import="fr.isima.stackyourflow.Question" %>

<div class="panel panel-default">

	<div class="panel-heading">

		Answered by <g:link controller="user" action="show" id="${answer?.user?.id}">${answer?.user?.username}</g:link> on ${answer?._creationDate}
	</div>


	<div class="panel-body" id="ans${answer.id}">

		<g:render template="/question/templateScoreView" model="[questionInstance:answer]" ></g:render>

		<g:if test="${answer?._score}">

			<span id="_score-label" class="property-label"><g:message code="a._score.label" default="Score" /></span>

			<span class="property-value" aria-labelledby="_score-label"><g:fieldValue bean="${answer}" field="_score"/></span>
			<br>
		</g:if>


		<g:if test="${answer?._text}">

			<span id="_text-answer-label" class="property-label"><g:message code="a._text.label" default="Text" /></span>

			<span class="property-value" aria-labelledby="_text-label"><g:fieldValue bean="${answer}" field="_text"/></span>


			<br>
		</g:if>


		<g:if test="${answer?.comments}">

			<span id="comments-label" class="property-label"><g:message code="a.comments.label" default="Comments" /></span>
			<br>
			<g:render template="/question/templateCommentView" collection="${answer.comments}" var="comment"></g:render>

			<br>
		</g:if>

		<g:isOwner owner="${answer?.user}">
			<g:form url="[resource:answer, action:'delete']" method="DELETE">
				<fieldset class="buttons">

						<g:remoteLink class="edit" action="editMode" id="${answer.id}" update="ans${answer.id}"><g:message code="default.button.edit.label" default="Edit Answer" /></g:remoteLink>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete Answer')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

				</fieldset>
			</g:form>
		</g:isOwner>



		<g:javascript library="prototype" />



	</div>

	<div class="panel-footer" id="commentaire_ans${answer.id}">

			<g:render template="templateLeaveACommentView" model="[answer:answer]"></g:render>
	</div>
</div>

