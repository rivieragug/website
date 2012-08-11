package org.ughub

class Event {
	Set tags
	String name
	String type
	static hasMany = [groups: Group, events: Event]
	static belongsTo = Group
    static constraints = {
		name()
		type()
    }

    String toString() { name }
}
