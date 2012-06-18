package addressBook



import org.junit.*
import grails.test.mixin.*

@TestFor(PhoneController)
@Mock(Phone)
class PhoneControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/phone/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.phoneInstanceList.size() == 0
        assert model.phoneInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.phoneInstance != null
    }

    void testSave() {
        controller.save()

        assert model.phoneInstance != null
        assert view == '/phone/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/phone/show/1'
        assert controller.flash.message != null
        assert Phone.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/phone/list'


        populateValidParams(params)
        def phone = new Phone(params)

        assert phone.save() != null

        params.id = phone.id

        def model = controller.show()

        assert model.phoneInstance == phone
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/phone/list'


        populateValidParams(params)
        def phone = new Phone(params)

        assert phone.save() != null

        params.id = phone.id

        def model = controller.edit()

        assert model.phoneInstance == phone
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/phone/list'

        response.reset()


        populateValidParams(params)
        def phone = new Phone(params)

        assert phone.save() != null

        // test invalid parameters in update
        params.id = phone.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/phone/edit"
        assert model.phoneInstance != null

        phone.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/phone/show/$phone.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        phone.clearErrors()

        populateValidParams(params)
        params.id = phone.id
        params.version = -1
        controller.update()

        assert view == "/phone/edit"
        assert model.phoneInstance != null
        assert model.phoneInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/phone/list'

        response.reset()

        populateValidParams(params)
        def phone = new Phone(params)

        assert phone.save() != null
        assert Phone.count() == 1

        params.id = phone.id

        controller.delete()

        assert Phone.count() == 0
        assert Phone.get(phone.id) == null
        assert response.redirectedUrl == '/phone/list'
    }
}
