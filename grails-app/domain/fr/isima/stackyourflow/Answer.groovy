package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Answer extends Post{

    public Answer() {
        _score = 0;
        solve = false;
    }


    boolean solve;
    static belongsTo = [question:Question]

    @Override
    public Question Redirect ()
    {
        return  (Question) question;
    }


    @Override
    public void resolve()
    {
        solve = true;
        question.resolve();
    }

    static constraints = {

        question nullable: true
    }
}
