def factory_excluir_segmentos(target):

    data = {

        'excluir_um_segmento': {
            'login': {
                'nome': 'Amanda Fornecedor SA',
                'usuario': 'B55BDBC2',
            },
            'segmento': 'Acessórios e Bagagem e Produtos de Higiene Pessoal',
        },

        'excluir_todos_segmentos': {
            'login': {
                'nome': 'Amanda Fornecedor SA',
                'usuario': 'B55BDBC2',
            },
            'segmento': 'Ferramentas e Máquinas Gerais',
        }

    }

    return data[target]
