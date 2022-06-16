def factory_exibir_resposta_publica(target):

    data = {
        'exibir_resposta_publica_mapa_comparativo': {
            'dados_comprador': {
                'nome': 'Renato Souza',
                'usuario': 'RENATOSOUZAFAST',
            },
            'dados_fornecedor': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'VEDANTESLIDER',
            },
            'lista_fornecedores': ['44.144.293/0001-56', '02.559.428/0001-02'],
        },
    }

    return data[target]
