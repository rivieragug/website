package org.ughub

import java.util.Set;

class Group {
	Set tags
	String name
	String description
	Image minilogo
	
	static hasMany = [events: Event, sponsors: Sponsor]
	static constraints = {
		name()		
	}

	static transients = ['members']

    String toString() {name}
	static mapping = {
		collection "ugroup"
		//sponsors(nullable:true)
    }
	
	void addMember(User m) {
		if (!Membership.findWhere(group: this, user: m)) {
			log.info "Adding $m to $this"
			new Membership(group: this, user: m).save(failOnError: true)
		}
	}

	void removeMember(User m) {
		Membership.findWhere(group: this, user: m)?.delete()
	}

	def getMembers() {
		Membership.findAllWhere(group: this).collect { it.user }
	}
}
