package stackyourflow

import fr.isima.authentication.User
import fr.isima.authentication.UserRole
import fr.isima.stackyourflow.Vote

class CheckAuthorTagLib {

    def springSecurityService


    def isOwner = { attrs, body ->

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
            if (loggedInUser?.id == owner?.id || admin) {
                out << body()
            }
        }


    }

    def isOwnerNotAdmin = { attrs, body ->

        if (springSecurityService.isLoggedIn()) {
            def loggedInUser = springSecurityService.currentUser
            def owner = attrs?.owner

            //id == 1 --> admin
            if (loggedInUser?.id == owner?.id ) {
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

    def progressBar = { attrs, body ->
        if (springSecurityService.isLoggedIn())
        {
            def user = springSecurityService.currentUser
            def badge = attrs.badge
            out << render(template: "/badge/userAdvance", model: [userInstance:user,badge:badge])
        }
        // out << "<g:render template=\"" + template + "\" model=\"[userInstance:${springSecurityService.currentUser}\"] />"
    }


    def currentUser = { attrs, body ->


        if (springSecurityService.isLoggedIn())
        {
         def user = springSecurityService.currentUser
          out << render(template: "/layouts/templateUserInfo", model: [userInstance:user])
        }
       // out << "<g:render template=\"" + template + "\" model=\"[userInstance:${springSecurityService.currentUser}\"] />"
    }

    def isOwnerOrSimpleUser = { attrs, body ->

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
            if (loggedInUser?.id == owner?.id || admin == false) {
                out << body()
            }
        }
        else
        {
            out << body()
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
