package fr.isima.stackyourflow
import fr.isima.authentication.User
/**
 * Created by Florian on 30/01/2015.
 */
class Message {

    public Message()
    {
        _creationDate = new Date();
    }

    String _text
    static belongsTo = [user:User]
    Date _creationDate;

    static constraints = {
        user nullable : true

    }

    def whoIsMyController()
    {
        return "message"
    }

    def whoIsMyMaster()
    {
        return user.id
    }
}
