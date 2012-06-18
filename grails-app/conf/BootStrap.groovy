import addressBook.security.Role
import addressBook.security.User
import addressBook.security.UserRole

class BootStrap {

	def init = { servletContext ->

		def admin = User.findByUsername('mrogers') ?: new User( username: "mrogers",password: "p@55wrd",accountExpired: false, accountLocked: false  ,enabled: true ).save(flush:true)
		def role = Role.findByAuthority("ADMIN") ?: new Role(authority: "ADMIN" ).save(flush:true)
		if (!admin.authorities.contains(role)) {
			UserRole.create(admin, role).save(flush:true)
		}
	}
	def destroy = {
	}
}
