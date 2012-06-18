package addressBook



import org.junit.*
import grails.test.mixin.*

@TestFor(EmailAddressController)
@Mock(EmailAddress)
class EmailAddressControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/emailAddress/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.emailAddressInstanceList.size() == 0
        assert model.emailAddressInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.emailAddressInstance != null
    }

    void testSave() {
        controller.save()

        assert model.emailAddressInstance != null
        assert view == '/emailAddress/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/emailAddress/show/1'
        assert controller.flash.message != null
        assert EmailAddress.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/emailAddress/list'


        populateValidParams(params)
        def emailAddress = new EmailAddress(params)

        assert emailAddress.save() != null

        params.id = emailAddress.id

        def model = controller.show()

        assert model.emailAddressInstance == emailAddress
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/emailAddress/list'


        populateValidParams(params)
        def emailAddress = new EmailAddress(params)

        assert emailAddress.save() != null

        params.id = emailAddress.id

        def model = controller.edit()

        assert model.emailAddressInstance == emailAddress
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/emailAddress/list'

        response.reset()


        populateValidParams(params)
        def emailAddress = new EmailAddress(params)

        assert emailAddress.save() != null

        // test invalid parameters in update
        params.id = emailAddress.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/emailAddress/edit"
        assert model.emailAddressInstance != null

        emailAddress.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/emailAddress/show/$emailAddress.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        emailAddress.clearErrors()

        populateValidParams(params)
        params.id = emailAddress.id
        params.version = -1
        controller.update()

        assert view == "/emailAddress/edit"
        assert model.emailAddressInstance != null
        assert model.emailAddressInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/emailAddress/list'

        response.reset()

        populateValidParams(params)
        def emailAddress = new EmailAddress(params)

        assert emailAddress.save() != null
        assert EmailAddress.count() == 1

        params.id = emailAddress.id

        controller.delete()

        assert EmailAddress.count() == 0
        assert EmailAddress.get(emailAddress.id) == null
        assert response.redirectedUrl == '/emailAddress/list'
    }
}
