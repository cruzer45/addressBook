package addressBook

class Address {

	static belongsTo = [person:Person]

	String title
	String street
	String city
	String state
	String zip
	String country

	static constraints = {
		person(editable:false)
		title(blank:false)
		street(blank:false)
		city()
		state()
		zip()
		country()
	}

	String toString() {
		return title
	}
}
