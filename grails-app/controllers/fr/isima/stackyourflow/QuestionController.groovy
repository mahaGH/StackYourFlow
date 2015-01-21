package fr.isima.stackyourflow


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuestionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    Question question;
    Answer AnswerInstance;

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Question.list(params), model: [questionInstanceCount: Question.count()]
    }

    def show(Question questionInstance) {
        Answer ans = new Answer();
        question = questionInstance;
        ans.question = questionInstance;
        respond questionInstance, [answerInstance: ans];
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


           // answerInstance.question = questionInstance;
            answerInstance.question = question;
            if (answerInstance.question.answers == null ) answerInstance.question.answers = new ArrayList<Answer>();

            answerInstance.question.answers.add(answerInstance);

            answerInstance.save();
            answerInstance.save flush: true


            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
                    redirect answerInstance
                }
                '*' { respond answerInstance, [status: CREATED] }
            }
    }

    def create() {
        respond new Question(params)
    }

    def createAnswer()
    {
        respond new Answer ( params );
    }

    def addAnswer(Question questionInstance) {

        if (answerController == null)
            answerController = new AnswerController()
        Answer ans =  answerController.create()
       // Answer ans = new Answer();

        ans.question = questionInstance;
        respond ans;
    }

    @Transactional
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
