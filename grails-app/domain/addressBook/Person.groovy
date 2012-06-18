package addressBook

import addressBook.security.User;
import grails.plugins.springsecurity.SpringSecurityService

class Person
{
	
	def springSecurityService

	static belongsTo = [user:User]
	
	String firstName
	String lastName
	String notes
	String nickName
	byte [] picture
	String pictureType

	static hasMany = [phones:Phone, emails:EmailAddress , addresses:Address, organizations:Organization]

	static constraints =
	{
		firstName(blank:false)
		lastName(blank:false)
		picture(nullable:true, maxSize: 2097152 /* 2M */)
		pictureType(nullable:true, display:false)
		phones()
		emails()
		addresses()
		organizations()
		notes(maxSize:1500)
		nickName()
		user(editable:false, diaplay:false)
	}

	String toString()
	{
		return firstName + " " + lastName
	}

	def beforeValidate()
	{
		if (!user )
		{
			user = springSecurityService.currentUser
		}
	}
		
}
