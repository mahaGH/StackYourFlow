package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Question extends Post {

    public Question() {
        _score = 0;
    }

    String _title
    String _url
    static hasMany = [answers:Answer, tags:Tag]

    @Override
    public Question Redirect() {
        return (Question) this;
    }



    static constraints = {
        _url nullable : true
    }
}
