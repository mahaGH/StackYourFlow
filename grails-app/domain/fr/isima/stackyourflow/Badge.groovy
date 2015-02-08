package fr.isima.stackyourflow
import fr.isima.authentication.User

/**
 * Created by ghayouba on 14/01/2015.
 */
class Badge {

    public Badge()
    {
        users = new ArrayList<User>();
    }

    String _name
    String _objective
    int _toReach
    String image

    static hasMany = [users:User]
    static belongsTo = User

    static constraints = {
        image nullable:  true
        users nullable: true
    }
}
