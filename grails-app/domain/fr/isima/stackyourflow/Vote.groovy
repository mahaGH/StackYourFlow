package fr.isima.stackyourflow

import fr.isima.authentication.User

/**
 * Created by Florian on 01/02/2015.
 */
class Vote {

    static belongsTo = [voter:User]
    Post refTo;
    int value;


    static constraints = {

    }

}
