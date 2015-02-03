<%@ page import="fr.isima.stackyourflow.Question" %>

<g:isNotOwner owner="${questionInstance?.user}">
	<g:hasVoted forPost="${questionInstance}" >


		<g:form controller="question"  action="votePlus" id="${questionInstance.id}" >

			<button type="submit" style="border: none; background: none" >
				<i class="glyphicon glyphicon-chevron-up"></i>
			</button>
		</g:form>
	</g:hasVoted>
</g:isNotOwner>

<span class="badge"><g:fieldValue bean="${questionInstance}" field="_score"/></span><br>

<g:isNotOwner owner="${questionInstance?.user}">
	<g:hasVoted forPost="${questionInstance}" >
		<g:form controller="question"  action="voteMinus" id="${questionInstance.id}" >

			<button type="submit" style="border: none; background: none" >
				<i class="glyphicon glyphicon-chevron-down"></i>
			</button>
		</g:form>
	</g:hasVoted>
</g:isNotOwner>

