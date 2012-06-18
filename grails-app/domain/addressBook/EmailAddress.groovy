package addressBook

class EmailAddress {

	static belongsTo = [person:Person]

	String title
	String emailAddress

	static constraints = {
		person(editable:false)
		title(blank:false)
		emailAddress(email:true)
	}

	String toString() {
		return title
	}
}
