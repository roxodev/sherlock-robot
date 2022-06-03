def factory_exibir_resposta_publica(target):

    data = {
        'exibir_resposta_novo_mapa': {
            'dados_comprador': {
                'nome': 'Renato Souza',
                'usuario': 'RENATOSOUZAFAST',
            },
            'dados_fornecedor': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'VEDANTESLIDER',
            },
            'lista_fornecedores': ['41.723.886/0001-89', '02.559.428/0001-02'],
        },
    }

    return data[target]
