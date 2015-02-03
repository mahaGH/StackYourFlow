package fr.isima.authentication

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

	// votes for user's posts
	static hasMany = [votes:Vote]

	static transients = ['springSecurityService']

	static constraints = {
		votes nullable: true
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
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
