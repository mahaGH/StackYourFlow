package fr.isima.stackyourflow

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class CommentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comment.list(params), model: [commentInstanceCount: Comment.count()]
    }

    def show(Comment commentInstance) {
        log.info("Showing comment " + commentInstance.id)
        respond commentInstance
    }

    def create() {
        log.info("creating new comment")
        respond new Comment(params)
    }

    def springSecurityService

    @Transactional
    def save(Comment commentInstance) {
        if (commentInstance == null) {
            notFound()
            return
        }

        if (commentInstance.hasErrors()) {
            respond commentInstance.errors, view: 'create'
            return
        }

        commentInstance.user = springSecurityService.currentUser
        commentInstance.save flush: true
        log.info(" comment saved:" + commentInstance.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
                redirect commentInstance
            }
            '*' { respond commentInstance, [status: CREATED] }
        }
    }

    def edit(Comment commentInstance) {
        log.info("editing comment " + commentInstance.id)
        respond commentInstance
    }

    @Transactional
    def update(Comment commentInstance) {
        if (commentInstance == null) {
            notFound()
            return
        }

        if (commentInstance.hasErrors()) {
            respond commentInstance.errors, view: 'edit'
            return
        }

        commentInstance.save flush: true
        log.info("updating comment " + commentInstance.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comment.label', default: 'Comment'), commentInstance.id])
                redirect commentInstance.refTo.Redirect()
            }
            '*' { respond commentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Comment commentInstance) {

        if (commentInstance == null) {
            notFound()
            return
        }

        log.info("delteing comment " + commentInstance.id)
        commentInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comment.label', default: 'Comment'), commentInstance.id])
                redirect commentInstance.refTo.Redirect()
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        log.info("Not found")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
