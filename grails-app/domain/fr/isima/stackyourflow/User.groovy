package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class User {
    String _noun
    String _password
    String _mail
    String _pictureAddress
    // corresponding to the reputation
    int _score

    static hasMany = [badges:Badge, questions:Question]

    static constraints = {
    }

    def vote(){}

    def comment(){}

    def post(){}
}
