from faker import Faker
fake = Faker()


def factory_cotacao_publica(target):

    data = {
        'exibir_resposta': {
            'comprador': {
                'nome': 'Renato Souza',
                'usuario': 'RENATOSOUZAFAST',
            },
            'fornecedor': {
                'nome': 'VEDANTES E ISOLANTES LIDER LTDA',
                'usuario': 'VEDANTESLIDER',
            },
            'fornecedores': ['41.723.886/0001-89', '02.559.428/0001-02'],
        },

        'ocultar_resposta': {
            'comprador': {
                'nome': 'Renato Souza',
                'usuario': 'RENATOSOUZAFAST',
            },
            'fornecedor': {
                'nome': 'VEDANTES E ISOLANTES LIDER LTDA',
                'usuario': 'VEDANTESLIDER',
                'id': '2729'
            },
            'fornecedores': ['41.723.886/0001-89', '02.559.428/0001-02'],
        },
    }

    return data[target]
