package addressBook

import org.springframework.dao.DataIntegrityViolationException

class EmailAddressController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [emailAddressInstanceList: EmailAddress.list(params), emailAddressInstanceTotal: EmailAddress.count()]
    }

    def create() {
        [emailAddressInstance: new EmailAddress(params)]
    }

    def save() {
        def emailAddressInstance = new EmailAddress(params)
        if (!emailAddressInstance.save(flush: true)) {
            render(view: "create", model: [emailAddressInstance: emailAddressInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), emailAddressInstance.id])
        redirect(action: "show", id: emailAddressInstance.id)
    }

    def show() {
        def emailAddressInstance = EmailAddress.get(params.id)
        if (!emailAddressInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])
            redirect(action: "list")
            return
        }

        [emailAddressInstance: emailAddressInstance]
    }

    def edit() {
        def emailAddressInstance = EmailAddress.get(params.id)
        if (!emailAddressInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])
            redirect(action: "list")
            return
        }

        [emailAddressInstance: emailAddressInstance]
    }

    def update() {
        def emailAddressInstance = EmailAddress.get(params.id)
        if (!emailAddressInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (emailAddressInstance.version > version) {
                emailAddressInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'emailAddress.label', default: 'EmailAddress')] as Object[],
                          "Another user has updated this EmailAddress while you were editing")
                render(view: "edit", model: [emailAddressInstance: emailAddressInstance])
                return
            }
        }

        emailAddressInstance.properties = params

        if (!emailAddressInstance.save(flush: true)) {
            render(view: "edit", model: [emailAddressInstance: emailAddressInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), emailAddressInstance.id])
        redirect(action: "show", id: emailAddressInstance.id)
    }

    def delete() {
        def emailAddressInstance = EmailAddress.get(params.id)
        if (!emailAddressInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])
            redirect(action: "list")
            return
        }

        try {
            emailAddressInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'emailAddress.label', default: 'EmailAddress'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
