package org.ughub

class Event {
	Set    tags
	String name
	String type
	Date   date
	String description
	static hasMany = [groups: Group, events: Event]
	static belongsTo = Group
    static constraints = {
		name()
		type()
		date nullable: true
    }

    String toString() { name }
}
