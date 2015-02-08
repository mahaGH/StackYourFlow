package fr.isima.stackyourflow

import grails.plugin.springsecurity.annotation.Secured

import javax.annotation.security.PermitAll

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured("permitAll")
class TagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tag.list(params), model: [tagInstanceCount: Tag.count()]
    }

    def show(Tag tagInstance) {
        respond tagInstance
    }

    def create() {
        respond new Tag(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Tag tagInstance) {
        if (tagInstance == null) {
            notFound()
            return
        }

        if (tagInstance.hasErrors()) {
            respond tagInstance.errors, view: 'create'
            return
        }

        tagInstance.save flush: true
        log.info("New tag saved")

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tag.label', default: 'Tag'), tagInstance.id])
                redirect tagInstance
            }
            '*' { respond tagInstance, [status: CREATED] }
        }
    }

    def edit(Tag tagInstance) {
        respond tagInstance
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Tag tagInstance) {
        if (tagInstance == null) {
            notFound()
            return
        }

        if (tagInstance.hasErrors()) {
            respond tagInstance.errors, view: 'edit'
            return
        }

        tagInstance.save flush: true
        log.info("New tag edited")

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tag.label', default: 'Tag'), tagInstance.id])
                redirect tagInstance
            }
            '*' { respond tagInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Tag tagInstance) {

        if (tagInstance == null) {
            notFound()
            return
        }

        tagInstance.delete flush: true
        log.info("Tag deleted")

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tag.label', default: 'Tag'), tagInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        log.info("not Found")
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
