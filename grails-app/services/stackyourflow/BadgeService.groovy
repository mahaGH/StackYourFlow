package stackyourflow

import fr.isima.authentication.User
import fr.isima.stackyourflow.Badge
import grails.transaction.Transactional

@Transactional
class BadgeService {

    def check(User user){

        for (Badge badge : Badge.list()) {

            // user does not have the badge but can have it
            if (! user.badges.contains(badge) && user.score >= badge._toReach)
                user.badges.add(badge)
        }


    }



    def serviceMethod() {

    }
}
