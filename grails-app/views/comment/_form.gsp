<%@ page import="fr.isima.stackyourflow.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="comment.user.label" default="User" />
		
	</label>
	<g:select id="user" name="user.id" from="${fr.isima.stackyourflow.User.list()}" optionKey="id" value="${commentInstance?.user?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: '_creationDate', 'error')} required">
	<label for="_creationDate">
		<g:message code="comment._creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="_creationDate" precision="day"  value="${commentInstance?._creationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: '_text', 'error')} required">
	<label for="_text">
		<g:message code="comment._text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_text" required="" value="${commentInstance?._text}"/>

</div>

