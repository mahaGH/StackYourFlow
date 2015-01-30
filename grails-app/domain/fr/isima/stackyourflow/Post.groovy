package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Post extends Message{

    int _score


    def votePlus(){}
    def voteMinus(){}

    def share(){}

    static constraints = {
        
        user nullable : true
    }
}
