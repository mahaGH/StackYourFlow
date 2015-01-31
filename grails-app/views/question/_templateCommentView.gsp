<%@ page import="fr.isima.stackyourflow.Question" %>


<div class="panel panel-default">

	<div class="panel-body" id="comment${comment.id}">

		<g:if test="${comment?.user}">

				<span id="user-label" class="property-label"><g:message code="comment.user.label" default="User" /></span>

				<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${comment?.user?.id}">${commentInstance?.user?.encodeAsHTML()}</g:link></span>


		</g:if>

		<g:if test="${comment?._creationDate}">

				<span id="_creationDate-label" class="property-label"><g:message code="comment._creationDate.label" default="Creation Date" /></span>

				<span class="property-value" aria-labelledby="_creationDate-label"><g:formatDate date="${comment?._creationDate}" /></span>


		</g:if>

		<g:if test="${comment?._text}">

				<span id="_text-label" class="property-label"><g:message code="comment._text.label" default="Text" /></span>

				<span class="property-value" aria-labelledby="_text-label"><g:fieldValue bean="${comment}" field="_text"/></span>


		</g:if>
	</div>
</div>


