package addressBook

class Person {

	String firstName
	String lastName
	String notes
	String nickName

	static hasMany = [phones:Phone, emails:EmailAddress , addresses:Address, organizations:Organization]

	static constraints = {
		firstName(blank:false)
		lastName(blank:false)
		phones()
		emails()
		addresses()
		notes(maxSize:1500)
		nickName()
	}

	String toString() {
		return firstName + " " + lastName
	}
}
