package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Answer {
    static hasMany = [questions:Question]
    static belongsTo = Question

    static constraints = {
    }
}
