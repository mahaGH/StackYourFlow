package fr.isima.authentication

import fr.isima.stackyourflow.Badge
import fr.isima.stackyourflow.Post
import fr.isima.stackyourflow.Vote



class User {

	transient springSecurityService

	String username
	String password
	String email
	int score
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	String nom
	String prenom
	String adresse
	Date birth
	byte[] img
	String avatarType


	// votes for user's posts
	static hasMany = [votes:Vote,badges:Badge]

	static transients = ['springSecurityService']

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

	def votePlus(Post postInstance){
		postInstance._score++;
	}
	def voteMinus(Post postInstance){
		postInstance._score--;
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}