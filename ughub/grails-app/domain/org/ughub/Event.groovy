package org.ughub

class Event {
	String name
	String type
	static hasMany = [groups:Group]
	static belongsTo = Group
    static constraints = {
		name()
		type()
    }
}
