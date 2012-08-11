package org.ughub

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [openIds: OpenID]
	
	static constraints = {
		username blank: false, unique: true
		password blank: true, nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		UserAuthority.findAllByUser(this).collect { it.authority } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		//encodePassword()
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	String toString() {
		username
	}
}
