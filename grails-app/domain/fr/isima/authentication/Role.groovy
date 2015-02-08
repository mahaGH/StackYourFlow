package fr.isima.authentication

/*
Class which represents the role
 */
class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
