<%@ page import="fr.isima.stackyourflow.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: '_score', 'error')} required">
	<label for="_score">
		<g:message code="answer._score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="_score" type="number" value="${answerInstance._score}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="answer.user.label" default="User" />
		
	</label>
	<g:select id="user" name="user.id" from="${fr.isima.stackyourflow.User.list()}" optionKey="id" value="${answerInstance?.user?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="answer.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${fr.isima.stackyourflow.Comment.list()}" multiple="multiple" optionKey="id" size="5" value="${answerInstance?.comments*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="answer.question.label" default="Question" />
		
	</label>
	<g:select id="question" name="question.id" from="${fr.isima.stackyourflow.Question.list()}" optionKey="id" value="${answerInstance?.question?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: '_text', 'error')} required">
	<label for="_text">
		<g:message code="answer._text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_text" required="" value="${answerInstance?._text}"/>

</div>

