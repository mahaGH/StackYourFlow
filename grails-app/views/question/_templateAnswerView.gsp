<%@ page import="fr.isima.stackyourflow.Question" %>

<div class="panel panel-default" id="ans_panel${answer.id}">

	<div class="panel-heading">
		${message(code: 'default.head.answer' )}&nbsp;<g:link controller="user" action="show" id="${answer?.user?.id}">${answer?.user?.username}</g:link>
		${message(code: 'default.head.answer2' , args: [answer?._creationDate])}

	</div>


	<div class="panel-body" id="ans${answer.id}">


		<g:if test="${answer?.solve}">
			<asset:image src="valider.png"/>
			<br>
		</g:if>

		<g:render template="/question/templateScoreView" model="[questionInstance:answer]" ></g:render>




		<g:if test="${answer?._text}">


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
			<fieldset class="nav">
				<ul>
					<g:form url="[resource:answer, action:'delete']" method="DELETE">


                        <li><g:remoteLink class="edit" action="editMode" id="${answer.id}" update="ans${answer.id}"><g:message code="default.button.edit.label" default="Edit Answer" /></g:remoteLink></li>
						<li><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete Answer')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></li>


					</g:form>

					<g:form controller="question" action="resolve" id="${answer.id}">
						<g:isOwner owner="${answer.question.user}">

							<g:if test="${! answer.question.resolved}">
								<li><g:actionSubmit action="resolve" value="${message(code: 'default.button.resolve.label')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></li>
							</g:if>
						</g:isOwner>
					</g:form>
				</ul>
			</fieldset>
		</g:isOwner>



		<g:javascript library="prototype" />



	</div>

	<div class="panel-footer" id="commentaire_ans${answer.id}">

			<g:render template="templateLeaveACommentView" model="[answer:answer]"></g:render>

	</div>
</div>

