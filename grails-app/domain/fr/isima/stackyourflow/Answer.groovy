package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Answer extends Post{

    public Answer() {
        _score = 0;
    }
    static hasMany = [comments:Comment]
    static belongsTo = [question:Question]

    static constraints = {
        comments nullable: true
        question nullable: true
    }
}
