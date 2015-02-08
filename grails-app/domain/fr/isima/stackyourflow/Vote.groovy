package fr.isima.stackyourflow

import fr.isima.authentication.User

/**
 * Created by Florian on 01/02/2015.
 */
class Vote {

    static belongsTo = [voter:User, refTo: Post]
    int value;


    static mapping = {

        refRo  cascade: "all-delete-orphan"
    }

    static constraints = {

    }

}
