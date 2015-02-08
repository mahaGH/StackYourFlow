package fr.isima.stackyourflow

/**
 * Created by rouxel on 14/01/2015.
 * Class of Comment = a text linked to an User (the person who has written the Comment)
 *      and the Post the user want to comment
 */
class Comment extends Message {

    static belongsTo = [refTo:Post]
    static constraints = {
        refTo nullable: true
    }

    @Override
    def whoIsMyController()
    {
        return "comment"
    }

    @Override
    def whoIsMyMaster()
    {
        return refTo.whoIsMyMaster()
    }
}
