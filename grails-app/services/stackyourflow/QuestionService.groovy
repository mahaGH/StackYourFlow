package stackyourflow

import fr.isima.authentication.User
import fr.isima.stackyourflow.Answer
import fr.isima.stackyourflow.Comment
import fr.isima.stackyourflow.Post
import fr.isima.stackyourflow.Question
import fr.isima.stackyourflow.Vote
import grails.transaction.Transactional

@Transactional
class QuestionService {

    def springSecurityService
    def badgeService

    def votePlus(Post postInstance) {

    User user = springSecurityService.currentUser
    postInstance._score++;


    Vote vote = new Vote();
    vote.refTo = postInstance;
    vote.value=1;
    vote.voter=user;

    if (postInstance.user.votes == null)
    postInstance.user.votes = new ArrayList<>();

    postInstance.user.votes.add(vote);
    postInstance.user.score++;
    badgeService.check(postInstance.user)

    postInstance.user.save();
    postInstance.save flush:true


    }


    def voteMinus(Post postInstance) {
        User user = springSecurityService.currentUser
        postInstance._score--;

        Vote vote = new Vote();
        vote.refTo = postInstance;
        vote.value = -1;
        vote.voter = user;

        if (postInstance.user.votes == null)
            postInstance.user.votes = new ArrayList<>();

        postInstance.user.votes.add(vote);
        postInstance.user.score--;
        postInstance.user.save();
        postInstance.save flush: true
    }


    def saveComment(Comment commentInstance, Post post) {

        commentInstance.user = springSecurityService.currentUser
        // log.info commentInstance.user.toString()
        // log.info springSecurityService.currentUser.toString()
        if (post != null) {
            commentInstance.refTo = post
            post = null;



            if (commentInstance.refTo.comments == null)
                commentInstance.refTo.comments = new ArrayList<>();

            commentInstance.refTo.refresh()
            commentInstance.refTo.comments.add(commentInstance)
        }


        commentInstance.save flush: true

    }

    def saveAnswer(Answer answerInstance, Question question) {

        answerInstance.user = springSecurityService.currentUser
        log.info(springSecurityService.currentUser.toString())

        // answerInstance.question = questionInstance;
        answerInstance.question = question;
        answerInstance._creationDate = new Date();
        if (answerInstance.question.answers == null) answerInstance.question.answers = new ArrayList<Answer>();


        answerInstance.question.answers.add(answerInstance);

        //answerInstance.save();
        answerInstance.save flush: true
    }

    def save(Question questionInstance) {

        questionInstance._score = 0
        questionInstance.answers = new ArrayList<Answer>()
        questionInstance._creationDate = new Date()
        questionInstance.user = springSecurityService.currentUser
        questionInstance.save flush: true
    }

    def updateAnswer(Answer answerInstance, Question question) {

        answerInstance.question = question;
        answerInstance.save flush: true
    }
}
