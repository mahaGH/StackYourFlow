<%@ page import="fr.isima.stackyourflow.Question" %>

<g:remoteLink action="leaveAComment" id="${answer.id}" update="commentaire_ans${answer.id}">${message(code: 'default.button.leave.a.comment')}</g:remoteLink>
