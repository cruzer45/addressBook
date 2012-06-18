package addressBook

class EmailAddress {

	static belongsTo = [person:Person]

	String title
	String emailAddress

	static constraints = {
		title(blank:false)
		emailAddress(email:true)
	}

	String toString() {
		return title
	}
}
