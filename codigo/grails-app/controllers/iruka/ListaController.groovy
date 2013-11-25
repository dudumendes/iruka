 package iruka



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ListaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

 @Transactional
def atualizarlista(Lista listaInstance)
{
for ( at in params.realizada )
 {
 
def atividade=Atividade.findById(at)


atividade.setRealizada(true)

println atividade.realizada
 
atividade.save flush:true

}


    

redirect action: "show", method: "GET",id:listaInstance.id



}

def exibirAtividades(Lista listaInstance) {
def lista = Lista.findById(params.id)
def atividadeInstanceList=Atividade.findByLista(lista)
      respond listaInstance,model:[atividadeInstanceList:atividadeInstanceList]
}







    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lista.list(params), model:[listaInstanceCount: Lista.count()]
    }

    def show(Lista listaInstance) {
      respond listaInstance, model:[comAtividade:Atividade.findByListaAndRealizada(listaInstance,false)] 
    }

    def create() {
        respond new Lista(params)
    }

    @Transactional
    def save(Lista listaInstance) {
        if (listaInstance == null) {
            notFound()
            return
        }

        if (listaInstance.hasErrors()) {
            respond listaInstance.errors, view:'create'
            return
        }

        listaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'listaInstance.label', default: 'Lista'), listaInstance.id])
                redirect listaInstance
            }
            '*' { respond listaInstance, [status: CREATED] }
        }
    }

    def edit(Lista listaInstance) {
        respond listaInstance
    }

    @Transactional
    def update(Lista listaInstance) {
        if (listaInstance == null) {
            notFound()
            return
        }

        if (listaInstance.hasErrors()) {
            respond listaInstance.errors, view:'edit'
            return
        }

        listaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Lista.label', default: 'Lista'), listaInstance.id])
                redirect listaInstance
            }
            '*'{ respond listaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Lista listaInstance) {

        if (listaInstance == null) {
            notFound()
            return
        }

        listaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Lista.label', default: 'Lista'), listaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'listaInstance.label', default: 'Lista'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
