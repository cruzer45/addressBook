package addressBook

class Organization {

	static belongsTo = [person:Person]

	String title
	String company

	static constraints = {
		person(editable:false)
		title(blank:false)
		company()
	}

	String toString() {
		return title
	}
}
