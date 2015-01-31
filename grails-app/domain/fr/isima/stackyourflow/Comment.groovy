package fr.isima.stackyourflow

/**
 * Created by ghayouba on 14/01/2015.
 */
class Comment extends Message {

    static belongsTo = [refTo:Post]
    static constraints = {
        refTo nullable: true
    }
}
