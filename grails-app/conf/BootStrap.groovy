import fr.isima.authentication.*
import fr.isima.stackyourflow.Tag

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)


        def user1 = new User(username: "admin", password: "admin", email:"admin@isima.fr").save(failOnError: true)
        def user2 = new User(username: "user", password: "user", email:"glou@hotmail.com").save(failOnError: true)
        UserRole.create user1, adminRole, true
        UserRole.create user1, userRole, true
        UserRole.create user2, userRole, true


        def tagJava = new Tag(_title: "java").save(flush: true)
        def tagJsf = new Tag(_title: "jsf").save(flush: true)


    }
    def destroy = {
    }
}
