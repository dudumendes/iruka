package iruka



import grails.test.mixin.*
import spock.lang.*

@TestFor(ListaController)
@Mock(Lista)
class ListaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.listaInstanceList
            model.listaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.listaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def lista = new Lista()
            lista.validate()
            controller.save(lista)

        then:"The create view is rendered again with the correct model"
            model.listaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            lista = new Lista(params)

            controller.save(lista)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/lista/show/1'
            controller.flash.message != null
            Lista.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def lista = new Lista(params)
            controller.show(lista)

        then:"A model is populated containing the domain instance"
            model.listaInstance == lista
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def lista = new Lista(params)
            controller.edit(lista)

        then:"A model is populated containing the domain instance"
            model.listaInstance == lista
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            status == 404

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def lista = new Lista()
            lista.validate()
            controller.update(lista)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.listaInstance == lista

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            lista = new Lista(params).save(flush: true)
            controller.update(lista)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/lista/show/$lista.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            status == 404

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def lista = new Lista(params).save(flush: true)

        then:"It exists"
            Lista.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(lista)

        then:"The instance is deleted"
            Lista.count() == 0
            response.redirectedUrl == '/lista/index'
            flash.message != null
    }
}
