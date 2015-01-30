import fr.isima.authentication.*

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)


        def user1 = new User(username: "admin", password: "admin", mail:"admin@isima.fr").save(failOnError: true)
        def user2 = new User(username: "user", password: "user", mail:"glou@hotmail.com").save(failOnError: true)
        UserRole.create user1, adminRole, true
        UserRole.create user2, userRole, true
    }
    def destroy = {
    }
}
