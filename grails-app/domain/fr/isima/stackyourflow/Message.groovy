package fr.isima.stackyourflow

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
}
