<%@ page import="fr.isima.stackyourflow.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: '_title', 'error')} required">
	<label for="_title">
		<g:message code="default.question.attrs._title" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_title" required="" value="${questionInstance?._title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: '_text', 'error')} required">
	<label for="_text">
		<g:message code="default.question.attrs.Text" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_text" required="" value="${questionInstance?._text}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: questionInstance, field: '_url', 'error')} required">
	<label for="_url">
		<g:message code="default.question.attrs.Url" default="Url" />
	</label>
	<g:textField name="_url"  value="${questionInstance?._url}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="default.main.menu.button.tags" default="Tags" />
		
	</label>
	<g:select name="tags" from="${fr.isima.stackyourflow.Tag.list()}" multiple="multiple" optionKey="id" optionValue="_title" size="5" value="${questionInstance?.tags*.id}" class="many-to-many"/>

</div>

