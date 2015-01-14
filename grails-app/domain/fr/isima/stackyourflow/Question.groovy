package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Question extends Post {
    String _title
    String _url
    static hasMany = [answers:Answer, tags:Tag]

    static constraints = {
    }
}
