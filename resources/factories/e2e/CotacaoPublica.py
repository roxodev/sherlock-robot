from faker import Faker
fake = Faker()


def factory_cotacao_publica(target):

    data = {
        'exibir_resposta': {
            'comprador': {
                'nome': 'Renato Souza',
                'login': 'RENATOSOUZAFAST',
            },
            'fornecedor': {
                'nome': 'MAXEL MATERIAIS ELETRICOS LTDA',
                'login': 'MAXEL22',
            },
            'fornecedores': ['41.723.886/0001-89', '02.559.428/0001-02'],
        },

        'ocultar_resposta': {
            'comprador': {
                'nome': 'Renato Souza',
                'login': 'RENATOSOUZAFAST',
            },
            'fornecedor': {
                'nome': 'MAXEL MATERIAIS ELETRICOS LTDA',
                'login': 'MAXEL22',
                'id': '3256'
            },
            'fornecedores': ['41.723.886/0001-89', '02.559.428/0001-02'],
            'msg_tooltip_btn_ocultar': 'Resposta pública já incluída no Mapa Comparativo, pois fornecedor consta na base de Meus Fornecedores. Clique para ocultar a resposta.'
        },
    }

    return data[target]
