<%@ page import="fr.isima.stackyourflow.Question" %>

<div class="panel panel-default">

	<div class="panel-body" id="question">

		<g:if test="${questionInstance?.user}">
			<li class="fieldcontain">
				<span id="user-label" class="property-label"><g:message code="question.user.label" default="User" /></span>

				<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${questionInstance?.user?.id}">${questionInstance?.user?.encodeAsHTML()}</g:link></span>

			</li>
		</g:if>

		<g:if test="${questionInstance?._score}">
			<li class="fieldcontain">
				<span id="_score-label" class="property-label"><g:message code="question._score.label" default="Score" /></span>

				<span class="property-value" aria-labelledby="_score-label"><g:fieldValue bean="${questionInstance}" field="_score"/></span>

			</li>
		</g:if>

		<g:if test="${questionInstance?._title}">
			<li class="fieldcontain">
				<span id="_title-label" class="property-label"><g:message code="question._title.label" default="Title" /></span>

				<span class="property-value" aria-labelledby="_title-label"><g:fieldValue bean="${questionInstance}" field="_title"/></span>

			</li>
		</g:if>
		<g:if test="${questionInstance?._text}">
			<li class="fieldcontain">
				<span id="_text-label" class="property-label"><g:message code="question._text.label" default="Text" /></span>

				<span class="property-value" aria-labelledby="_text-label"><g:fieldValue bean="${questionInstance}" field="_text"/></span>

			</li>
		</g:if>



		<g:if test="${questionInstance?._url}">
			<li class="fieldcontain">
				<span id="_url-label" class="property-label"><g:message code="question._url.label" default="Url" /></span>

				<span class="property-value" aria-labelledby="_url-label"><g:fieldValue bean="${questionInstance}" field="_url"/></span>

			</li>
		</g:if>

		<g:if test="${questionInstance?.answers}">
			<li class="fieldcontain">
				<span id="answers-label" class="property-label"><g:message code="question.answers.label" default="Answers" /></span>
				<br>
				<g:render template="/question/templateAnswerView" collection="${questionInstance.answers}" var="answer"></g:render>






			</li>
		</g:if>

		<g:if test="${questionInstance?.tags}">
			<li class="fieldcontain">
				<span id="tags-label" class="property-label"><g:message code="question.tags.label" default="Tags" /></span>

				<g:each in="${questionInstance.tags}" var="t">
					<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
				</g:each>

			</li>
		</g:if>

	</div>
</div>

