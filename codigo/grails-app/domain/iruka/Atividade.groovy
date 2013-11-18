package iruka

class Atividade {
String nome_da_atividade
Date data_de_inclusao
boolean realizada
static belongsTo = [lista: Lista]
String toString() {

   return nome_da_atividade
}



    static constraints = {
    }
}
