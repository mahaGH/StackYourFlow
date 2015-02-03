package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Post extends Message{

    int _score
    static hasMany = [comments:Comment]

    public Question Redirect() {
        return new Question();
    }


    def share(){}

    static constraints = {
        comments nullable: true
        user nullable : true
    }
}
