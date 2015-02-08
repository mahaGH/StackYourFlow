package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Question extends Post {

    public Question() {
        _score = 0;
        resolved = false;
    }

    String _title
    String _url
    boolean resolved;
    static hasMany = [answers:Answer, tags:Tag]

    @Override
    public Question Redirect() {
        return (Question) this;
    }

    @Override
    public void resolve()
    {
        resolved = true;
    }

    @Override
    def whoIsMyController()
    {
        return "question"
    }

    @Override
    def whoIsMyMaster()
    {
        return this.id
    }

    static mapping = {
        answers sort: '_score' , order: 'desc'
    }

    static constraints = {
        _url nullable : true
    }
}
