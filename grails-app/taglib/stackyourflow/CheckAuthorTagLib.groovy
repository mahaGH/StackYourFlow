package stackyourflow

import fr.isima.authentication.User
import fr.isima.authentication.UserRole
import fr.isima.stackyourflow.Vote

class CheckAuthorTagLib {

    def springSecurityService


    def isOwner = { attrs, body ->

        if (springSecurityService.isLoggedIn()) {
            def loggedInUser = springSecurityService.currentUser
            def owner = attrs?.owner


            //id == 1 --> admin
            //loggedInUser.id == owner.id --> utilisateur courrant == createur du post
            if (loggedInUser?.id == owner?.id || loggedInUser?.id == 1) {
                out << body()
            }
        }
    }

    def isNotOwner = { attrs, body ->

        if (springSecurityService.isLoggedIn()) {
            def loggedInUser = springSecurityService.currentUser
            def roles = springSecurityService.getAuthentication().getAuthorities()
            def admin = false;

            for (def role : roles)
            {
                if (role.authority.equals("ROLE_ADMIN"))
                {
                    admin = true;
                    break;
                }
            }

            def owner = attrs?.owner

            //id == 1 --> admin
            if (loggedInUser?.id != owner?.id || admin) {
                out << body()
            }
        }

    }

    def hasVoted = { attrs, body ->
        User loggedInUser = springSecurityService.currentUser
        def post = attrs?.forPost
        boolean found = false;


        for (Vote vote in loggedInUser.votes )
        {
            if (vote.refTo.id == post.id && vote.voter.id == loggedInUser.id)
            {
                found = true;
                break;
            }

        }

        if(found == false)
        {
            out << body()
        }
    }

    def isLogged = { attrs, body ->

        //id == 1 --> admin
        if(springSecurityService.isLoggedIn() == true)
        {
            out << body()
        }
    }

    def isNotLogged = { attrs, body ->

        //id == 1 --> admin
        if(springSecurityService.isLoggedIn() == false)
        {
            out << body()
        }
    }

}
