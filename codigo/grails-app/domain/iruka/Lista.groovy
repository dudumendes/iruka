package iruka

class Lista {
String nome_Lista
Date data_de_inclusao

static hasMany = [atividade:Atividade]
String toString() {

   return nome_Lista

}




    static constraints = {
    }
}
