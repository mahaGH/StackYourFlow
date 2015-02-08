package fr.isima.stackyourflow

/**
 * Created by rouxel on 14/01/2015.
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

    @Override
    def whoIsMyController()
    {
        return "answer"
    }

    @Override
    def whoIsMyMaster()
    {
        return question.id
    }

    static constraints = {

        question nullable: true
    }
}
