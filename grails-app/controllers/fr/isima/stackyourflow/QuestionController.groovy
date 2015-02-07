package fr.isima.stackyourflow

import fr.isima.authentication.User

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured("permitAll")
class QuestionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    //la question qui est affichée
    Question question;

    Post post;




    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Question.list(params), model: [questionInstanceCount: Question.count()]
    }

    def unanswered(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Question.findAllByResolvedNotEqual(true), model: [questionInstanceCount: Question.count()]



    }

    def show(Question questionInstance) {
        Answer ans = new Answer();
        question = questionInstance;
        User currentUser = springSecurityService.currentUser
        post = null;
        //question.user = springSecurityService.currentUser
        respond questionInstance,[answerInstance: ans]
        //respond currentUser
    }

    def resolve(Answer ans) {
        ans.resolve();
        ans.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Answer.label', default: 'Answer'), ans.id])
                redirect ans.question
            }
            '*' { respond ans, [status: OK] }
        }

    }


    def editMode(Answer answerInstance) {

        render(template:'templateAnswerEditView', model: [answer: answerInstance])

    }

    def editComment(Comment commentInstance)
    {
        render(template: 'templateCommentEditView',model: [comment:commentInstance])
    }

    def votePlus(Post postInstance)
    {
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
        postInstance.user.save();
        postInstance.save flush:true

        request.withFormat {
            form multipartForm {
                redirect postInstance.Redirect()
            }
            '*' { respond commentInstance, [status: CREATED] }
        }
    }

    def voteMinus(Post postInstance)
    {
        User user = springSecurityService.currentUser
        postInstance._score--;

        Vote vote = new Vote();
        vote.refTo = postInstance;
        vote.value=-1;
        vote.voter=user;

        if (postInstance.user.votes == null)
            postInstance.user.votes = new ArrayList<>();

        postInstance.user.votes.add(vote);
        postInstance.user.score--;
        postInstance.user.save();
        postInstance.save flush:true

        request.withFormat {
            form multipartForm {
                redirect postInstance.Redirect()
            }
            '*' { respond commentInstance, [status: CREATED] }
        }
    }


    @Transactional
    def saveComment(Comment commentInstance) {
        if (commentInstance == null) {
            notFound()
            return
        }

        if (commentInstance.hasErrors()) {
            respond commentInstance.errors, view: 'create'
            return
        }

        commentInstance.user = springSecurityService.currentUser
       // log.info commentInstance.user.toString()
       // log.info springSecurityService.currentUser.toString()
        if (post != null)
        {
            commentInstance.refTo = post
            post = null;



            if (commentInstance.refTo.comments == null)
                commentInstance.refTo.comments = new ArrayList<>();

            commentInstance.refTo.refresh()
            commentInstance.refTo.comments.add(commentInstance)
        }


        commentInstance.save flush: true




            request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
                redirect commentInstance.refTo.Redirect()
            }
            '*' { respond commentInstance, [status: CREATED] }
             }


    }

    def leaveAComment(Post postInstance) {
        //params = ${postInstance.id}
        //comment.refTo = postInstance;
        Comment comment = new Comment();

        if (post == null)
        {
            post = postInstance
            // respond commentInstance:comment
            render template: "templateCommentCreate",model: [commentInstance:comment]
            render template: "templateCancelLeaveACommentView", model:[answer: postInstance]
        };
        else
        {

            render template: 'templateLeaveACommentView', model: [answer: postInstance]
            render text:"<br>un seul commentaire peut être crée à la fois\n"

        }


    }

    def annulerComment(Post postInstance)
    {
        post = null;
        render(template: 'templateLeaveACommentView', model: [answer: postInstance])
    }



    @Transactional
    def deleteAnswer(Answer answerInstance) {

        if (answerInstance == null) {
            notFound()
            return
        }

        Question q = answerInstance.question;
        answerInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Answer.label', default: 'Answer'), answerInstance.id])
                redirect q
            }
            '*' { render status: NO_CONTENT }
        }
    }

    def springSecurityService

    @Transactional
    def saveAnswer(Answer answerInstance)
    {
            if (answerInstance == null) {
                notFound()
                return
            }

            if (answerInstance.hasErrors()) {
                respond answerInstance.errors, view: 'create'
                return
            }


            answerInstance.user = springSecurityService.currentUser
            log.info(springSecurityService.currentUser.toString())

           // answerInstance.question = questionInstance;
            answerInstance.question = question;
            answerInstance._creationDate = new Date();
            if (answerInstance.question.answers == null ) answerInstance.question.answers = new ArrayList<Answer>();


            answerInstance.question.answers.add(answerInstance);


            //answerInstance.save();
            answerInstance.save flush: true


            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
                    redirect answerInstance.question
                }
                '*' { respond answerInstance, [status: CREATED] }
            }
    }

    def create() {
        respond new Question(params)
    }





    @Transactional
    @Secured(['ROLE_USER'])
    def save(Question questionInstance) {
        if (questionInstance == null) {
            notFound()
            return
        }

        if (questionInstance.hasErrors()) {
            respond questionInstance.errors, view: 'create'
            return
        }

        questionInstance._score = 0
        questionInstance.answers = new ArrayList<Answer>()
        questionInstance._creationDate = new Date()
        questionInstance.user = springSecurityService.currentUser
        questionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
                redirect questionInstance
            }
            '*' { respond questionInstance, [status: CREATED] }
        }
    }

    def edit(Question questionInstance) {
        respond questionInstance
    }

    @Transactional
    def updateAnswer(Answer answerInstance) {
            if (answerInstance == null) {
                notFound()
                return
            }

            if (answerInstance.hasErrors()) {
                respond answerInstance.errors, view: 'edit'
                return
            }

            answerInstance.question = question;
            answerInstance.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'Answer.label', default: 'Answer'), answerInstance.id])
                    redirect answerInstance.question
                }
                '*' { respond answerInstance, [status: OK] }
            }
    }

    @Transactional
    def update(Question questionInstance) {
        if (questionInstance == null) {
            notFound()
            return
        }

        if (questionInstance.hasErrors()) {
            respond questionInstance.errors, view: 'edit'
            return
        }




        questionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Question.label', default: 'Question'), questionInstance.id])
                redirect questionInstance
            }
            '*' { respond questionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Question questionInstance) {

        if (questionInstance == null) {
            notFound()
            return
        }

        questionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Question.label', default: 'Question'), questionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
