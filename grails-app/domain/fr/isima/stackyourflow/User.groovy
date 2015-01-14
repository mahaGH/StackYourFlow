package fr.isima.stackyourflow

class User {
    String _noun
    String _password
    String _mail
    String _pictureAdress
    // corresponding to the reputation
    int _score
    List<Badge> _badges
    List<Question> _questions

    static constraints = {
    }

    def vote(){}

    def comment(){}

    def post(){}

}
