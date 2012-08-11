package org.ughub

class Group {
	String name
	String description
	String logoPath
	static hasMany = [members:Member]
	static constraints = {
	}
}
