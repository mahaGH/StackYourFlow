<%@ page import="fr.isima.stackyourflow.Vote" %>



<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'refTo', 'error')} required">
	<label for="refTo">
		<g:message code="vote.refTo.label" default="Ref To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="refTo" name="refTo.id" from="${fr.isima.stackyourflow.Post.list()}" optionKey="id" required="" value="${voteInstance?.refTo?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="vote.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" type="number" value="${voteInstance.value}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'voter', 'error')} required">
	<label for="voter">
		<g:message code="vote.voter.label" default="Voter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="voter" name="voter.id" from="${fr.isima.authentication.User.list()}" optionKey="id" required="" value="${voteInstance?.voter?.id}" class="many-to-one"/>

</div>

