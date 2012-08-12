package org.ughub

class Event {
	Set    tags
	String name
	String type
	Date   date
	String description

	Group organizingGroup

	static hasMany = [participatingGroups: Group]

	static belongsTo = Group
    static constraints = {
		name()
		type()
		date nullable: true
		organizingGroup()
		description()
    }

    String toString() { name }
}
