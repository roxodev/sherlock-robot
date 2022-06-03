def factory_ocultar_resposta_publica(target):

    data = {
        'ocultar_resposta_publica_novo_mapa': {
            'dados_comprador': {
                'nome': 'Renato Souza',
                'usuario': 'RENATOSOUZAFAST',
            },
            'dados_fornecedor': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'VEDANTESLIDER',
                'id': '2729'
            },
            'lista_fornecedores': ['41.723.886/0001-89', '02.559.428/0001-02'],
        },
    }

    return data[target]
