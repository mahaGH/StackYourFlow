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

    // le post qui se rattache au commentaire courrant
    Post post;

    // éviter la mort des chatons
    def questionService


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Question.list(params), model: [questionInstanceCount: Question.count()]
    }

    def unanswered(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Question.findAllByResolvedNotEqual(true), model: [questionInstanceCount: Question.count()]

    }

    def show(Question questionInstance) {

        //create
        Answer ans = new Answer();

        //pour ajax
        question = questionInstance;
        post = null;

        respond questionInstance,[answerInstance: ans]

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
        questionService.votePlus(postInstance)


        request.withFormat {
            form multipartForm {
                redirect postInstance.Redirect()
            }
            '*' { respond commentInstance, [status: CREATED] }
        }
    }

    def voteMinus(Post postInstance)
    {
        questionService.voteMinus(postInstance)

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

        questionService.saveComment(commentInstance, post)
        post = null;

        request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
            redirect commentInstance.refTo.Redirect()
        }
        '*' { respond commentInstance, [status: CREATED] }
         }


    }

    // ajax
    def leaveAComment(Post postInstance) {

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

    //ajax
    def annulerComment(Post postInstance)
    {
        post = null;
        render(template: 'templateLeaveACommentView', model: [answer: postInstance])
    }


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


           questionService.saveAnswer(answerInstance,question)


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

        questionService.save(questionInstance)

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

            questionService.updateAnswer(aswerInstance,question)

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
