package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Post extends Message{

    int _score
    static hasMany = [comments:Comment, votes:Vote]

    public Question Redirect() {
        return new Question();
    }

    public void resolve() {

    }

    def share(){}

    static mapping = {

        votes  cascade: "all-delete-orphan"
    }

    static constraints = {
        comments nullable: true
        user nullable : true


    }
}
