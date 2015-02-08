import fr.isima.authentication.*
import fr.isima.stackyourflow.Badge
import fr.isima.stackyourflow.Question
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


        def question = new Question()
        question._text = "who is the best?"
        question._title = "I wondered ..."
        question.user = user1
        question.save(flush: true)

        def badge1 = new Badge()
        badge1._name = "Newby"
        badge1._objective = "Get a score of 1"
        badge1._toReach = 1
        badge1.image="badge0.png"
        badge1.save()

        def badge2 = new Badge()
        badge2._name = "Curious"
        badge2._objective = "Get a score of 10"
        badge2._toReach = 10
        badge2.image="badge1.jpg"
        badge2.save()

        def badge3 = new Badge()
        badge3._name = "Me, again"
        badge3._objective = "Get a score of 50"
        badge3._toReach = 50
        badge3.image="badge2.png"
        badge3.save()

        def badge4 = new Badge()
        badge4._name = "Hard Worker"
        badge4._objective = "Get a score of 100"
        badge4._toReach = 100
        badge4.image="badge3.jpg"
        badge4.save()

        def badge5 = new Badge()
        badge5._name = "God walking among mere mortal"
        badge5._objective = "Get a score of 1000"
        badge5._toReach = 1000
        badge5.image="badge4.jpg"
        badge5.save()


        def tagJava = new Tag(_title: "java").save(flush: true)
        def tagJsf = new Tag(_title: "jsf").save(flush: true)


    }
    def destroy = {
    }
}
