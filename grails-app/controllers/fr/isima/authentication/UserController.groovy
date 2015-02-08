package fr.isima.authentication


import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('permitAll')
class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
    private static final okcontents = ['image/png', 'image/jpeg', 'image/gif']


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        log.info("go to user index")
        respond User.list(params), model: [userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        log.info("showing user:" + userInstance.id)
        respond userInstance
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        log.info("creating new user")
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        log.info("saving user:" + userInstance.id)
        log.info("reading file ...")
        def f = request.getFile('avatar')

        userInstance.img = f.bytes
        userInstance.avatarType = f.contentType

        flash.message = "Avatar (${userInstance.avatarType}, ${userInstance.img.size()} bytes) uploaded."

        log.info("saving ...")
       if (! userInstance.save(flush: true) ) {
           userInstance.img = null
           userInstance.avatarType = null
           respond userInstance.errors, view: 'create'
           log.info("error while saving: picture is too big")
       }
        else {
           log.info("saved successful")
           request.withFormat {
               form multipartForm {
                   flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                   redirect userInstance
               }
               '*' { respond userInstance, [status: CREATED] }
           }
       }
    }

    def avatar_image() {
        log.info("loading file ...")
        def avatarUser = User.get(params.id)
        if (!avatarUser || !avatarUser.img || !avatarUser.avatarType) {
            response.sendError(404)
            return
        }
        response.contentType = avatarUser.avatarType
        response.contentLength = avatarUser.img.size()
        OutputStream out = response.outputStream
        out.write(avatarUser.img)
        out.close()
    }

    def edit(User userInstance) {
        log.info("editing user:" + userInstance.id)
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        log.info("Editing user:" + userInstance.id)
        def f = request.getFile('avatar')

        if (okcontents.contains(f.contentType)) {
            log.info("saving file ...")
            userInstance.img = f.bytes

            userInstance.avatarType = f.contentType
        }

      //  flash.message = "Avatar (${userInstance.avatarType}, ${userInstance.img.size()} bytes) uploaded."

        if (! userInstance.save(flush: true) ) {
            userInstance.img = null
            userInstance.avatarType = null
            respond userInstance.errors, view: 'edit'
            log.info("Edit failed: picture is too big")
        }
        else {
            log.info("success")
            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                    redirect userInstance
                }
                '*' { respond userInstance, [status: OK] }
            }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true
        log.info("deleting user:" + userInstance.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {

        log.info("not found")

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
