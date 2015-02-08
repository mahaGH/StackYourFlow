<%@ page import="fr.isima.stackyourflow.Question" %>

<g:remoteLink action="annulerComment" id="${answer.id}" update="commentaire_ans${answer.id}">${message(code: 'default.button.cancel', default: 'Cancel')}</g:remoteLink>
