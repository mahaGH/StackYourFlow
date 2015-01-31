package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Answer extends Post{

    public Answer() {
        _score = 0;
    }

    static belongsTo = [question:Question]

    @Override
    public Question Redirect ()
    {
        return  (Question) question;
    }

    static constraints = {

        question nullable: true
    }
}
