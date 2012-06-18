package addressBook

class Phone
{

	static belongsTo = [person:Person]

	String title
	String number

	static constraints =
	{
		person(editable:false)
		title(Blank:false)
		number()
	}

	String toString()
	{
		return title + ": " + number
	}

	def beforeValidate()
	{
		title = title?.trim()?.capitalize()
		number = number?.trim()
	}
}
