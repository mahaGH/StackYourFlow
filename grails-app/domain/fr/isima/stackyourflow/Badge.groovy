package fr.isima.stackyourflow
import fr.isima.authentication.User

/**
 * Created by ghayouba on 14/01/2015.
 */
class Badge {
    String _name

    static belongsTo = [user:User]

    static constraints = {
    }
}
