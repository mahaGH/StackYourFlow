<%@ page import="fr.isima.stackyourflow.Badge" %>


<div class="progress">
	<div class="progress-bar" role="progressbar" aria-valuenow="${userInstance.score}" aria-valuemin="0" aria-valuemax="${badge._toReach}" style="width: ${userInstance.score / badge._toReach * 100}%;" aria-valuetext="${userInstance.score}/${badge._toReach}">

	</div>
</div>
