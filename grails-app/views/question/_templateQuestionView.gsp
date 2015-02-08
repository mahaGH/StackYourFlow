<%@ page import="fr.isima.stackyourflow.Question" %>

<div class="panel panel-default">

	<div class="panel-heading">
		${message(code: 'default.head.question' )}&nbsp;<g:link controller="user" action="show" id="${questionInstance?.user?.id}">${questionInstance?.user?.username}</g:link>
		${message(code: 'default.head.question2' , args: [questionInstance?._creationDate])}
	</div>

	<div class="panel-body" id="question">

		<g:if test="${questionInstance?.resolved}">
			<asset:image src="valider.png"/>
		</g:if>

		<g:if test="${questionInstance?._title}">
			<li class="fieldcontain">

				<span class="property-value" aria-labelledby="_title-label"><u><g:fieldValue bean="${questionInstance}" field="_title"/></u></span>

			</li>
			<br>
		</g:if>
		<g:if test="${questionInstance?._score}">
			<li class="fieldcontain">
				<span id="_score-label" class="property-label"><g:message code="question._score.label" default="Score" /></span>

				<span class="property-value" aria-labelledby="_score-label"><g:fieldValue bean="${questionInstance}" field="_score"/></span>

			</li>
		</g:if>

		<g:render template="/question/templateScoreView" model="[questionInstance:questionInstance]"></g:render>





		<g:if test="${questionInstance?._text}">
			<li class="fieldcontain">

				<span class="property-value" aria-labelledby="_text-label"><g:fieldValue bean="${questionInstance}" field="_text"/></span>

			</li>
			<br>
		</g:if>




		<g:if test="${questionInstance?._url}">
			<li class="fieldcontain">
				<span id="_url-label" class="property-label"><g:message code="question._url.label" default="Url" /></span>

				<span class="property-value" aria-labelledby="_url-label"><g:fieldValue bean="${questionInstance}" field="_url"/></span>

			</li>
		</g:if>



		<g:if test="${questionInstance?.tags}">
			<li class="fieldcontain">

				<g:each in="${questionInstance.tags}" var="t">
					<span class="label label-info"><g:link controller="tag" action="show" id="${t.id}">${t?._title}</g:link></span>
				</g:each>

			</li>
			<br>
		</g:if>

		<g:isOwner owner="${questionInstance?.user}">
			<g:form url="[resource:questionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${questionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</g:isOwner>



	</div>

	<g:isLogged>
		<div class="panel-footer" id="commentaire_ans${questionInstance?.id}">
			<g:render template="templateLeaveACommentView" model="[answer:questionInstance]"></g:render>

		</div>
	</g:isLogged>
</div>

<g:if test="${questionInstance?.comments}">
	<li class="fieldcontain">

		<span id="comments-label" class="property-label"><g:message code="default.question.attrs.Comments" default="Comments" /></span>
		<br>
		<g:render template="/question/templateCommentView" collection="${questionInstance?.comments}" var="comment"></g:render>

		<br>
	</li>
</g:if>

		<g:if test="${questionInstance?.answers}">
			<li class="fieldcontain">
				<span id="answers-label" class="property-label"><g:message code="question.answers.label" args="${questionInstance.answers.size()}" /></span>
				<br>
				<g:render template="/question/templateAnswerView" collection="${questionInstance?.answers}" var="answer"></g:render>


			</li>
		</g:if>



