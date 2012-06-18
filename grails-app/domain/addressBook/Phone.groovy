package addressBook

class Phone {

	static belongsTo = [person:Person]

	String title
	String number

	static constraints = {
		title(Blank:false)
		number()
	}

	String toString() {
		return title
	}
}
