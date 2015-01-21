package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Post {
    String _text
    int _score
    static belongsTo = [user:User]

    def create(){}

    def votePlus(){}
    def voteMinus(){}

    def addComment(){}
    def share(){}
    def edit(){}

    static constraints = {
        _score nullable : true
        user nullable : true
    }
}
