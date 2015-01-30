<%@ page import="fr.isima.stackyourflow.Question" %>

<div class="panel panel-default">

	<div class="panel-body" id="ans${answer.id}">
		<g:if test="${answer?._score}">

			<span id="_score-label" class="property-label"><g:message code="a._score.label" default="Score" /></span>

			<span class="property-value" aria-labelledby="_score-label"><g:fieldValue bean="${answer}" field="_score"/></span>
			<br>
		</g:if>
		<g:if test="${answer?.user}">
			<span id="user-label" class="property-label"><g:message code="a.user.label" default="User" /></span>

			<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${answer?.user?.id}">${a?.user?.encodeAsHTML()}</g:link></span>
			<br>
		</g:if>

		<g:if test="${answer?.comments}">

			<span id="comments-label" class="property-label"><g:message code="a.comments.label" default="Comments" /></span>

			<g:each in="${answer.comments}" var="c">
				<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
			</g:each>


			<br>
		</g:if>


		<g:if test="${answer?._text}">

			<span id="_text-answer-label" class="property-label"><g:message code="a._text.label" default="Text" /></span>

			<span class="property-value" aria-labelledby="_text-label"><g:fieldValue bean="${answer}" field="_text"/></span>


			<br>
		</g:if>

		<g:form url="[resource:answer, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:remoteLink class="edit" action="editMode" id="${answer.id}" update="ans${answer.id}"><g:message code="default.button.edit.label" default="Edit" /></g:remoteLink>
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>

		<g:javascript library="prototype" />



	</div>
</div>

