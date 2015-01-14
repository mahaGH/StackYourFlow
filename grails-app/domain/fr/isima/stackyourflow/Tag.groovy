package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Tag {
    String _title;
    static hasMany = [questions:Question]
    static belongsTo = Question

    static constraints = {
    }
}
