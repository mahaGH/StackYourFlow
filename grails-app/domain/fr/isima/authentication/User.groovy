package fr.isima.authentication

import fr.isima.stackyourflow.Badge
import fr.isima.stackyourflow.Message
import fr.isima.stackyourflow.Post
import fr.isima.stackyourflow.Vote
/*
Class which represents an User account
 */
class User {

	transient springSecurityService
	//all the account informations neccesary
	String username
	String password
	String email
	int score
	//caracteristics of the account
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	//Personal informations
	String nom
	String prenom
	String adresse
	Date birth
	//caracteristics of the profile image
	byte[] img
	String avatarType


	// votes for user's posts
	static hasMany = [votes:Vote,badges:Badge,posts:Message]

	static transients = ['springSecurityService']

	//constraints of attributes
	static constraints = {
		votes nullable: true
		username blank: false, unique: true
		password blank: false
		nom nullable: true
		prenom nullable: true
		adresse nullable: true
		birth nullable: true
		img (nullable:true, maxSize: 160384 /* 1600K */)
		avatarType nullable: true

	}

	static mapping = {
		password column: '`password`'
		votes cascade: "all-delete-orphan"
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}
	//incrementation of the score of the voted Post
	def votePlus(Post postInstance){
		postInstance._score++;
	}
	//incrementation of the score of the downvoted Post
	def voteMinus(Post postInstance){
		postInstance._score--;
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}