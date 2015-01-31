package fr.isima.authentication

import grails.transaction.Transactional

import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class SecureController {

    def index() {
        render 'Secure access only'
    }
}
