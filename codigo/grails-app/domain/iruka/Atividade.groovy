package iruka

class Atividade {
String nome_da_atividade
Date data_de_inclusao
static belongsTo = [lista: Lista]



    static constraints = {
    }
}
