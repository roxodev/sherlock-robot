
def factory_adicionar_segmentos(target):

    data = {

        'segmento_pai_cadastrado': {
            'login': {
                'nome': 'Amanda Fornecedor SA',
                'usuario': 'B55BDBC2',
            },
            'segmento': 'Ferramentas e Máquinas Gerais'
        },

        'segmento_pai_nao_cadastrado': {
            'login': {
                'nome': 'Amanda Fornecedor SA',
                'usuario': 'B55BDBC2',
            },
            'segmento': 'Acessórios e Bagagem e Produtos de Higiene Pessoal'
        },

        'segmento_filho_pai_cadastrado': {
            'login': {
                'nome': 'Amanda Fornecedor SA',
                'usuario': 'B55BDBC2',
            },
            'segmento': 'Máquinas e equipamentos pneumáticos'
        },

        'segmento_filho_pai_nao_cadastrado': {
            'login': {
                'nome': 'Amanda Fornecedor SA',
                'usuario': 'B55BDBC2',
            },
            'segmento_pai': 'Tecnologia da Informação, Difusão e Telecomunicações',
            'segmento_filho': 'Equipamentos e acessórios de computador',

        },

        'submeter_sem_segmentos': {
            'login': {
                'nome': 'DANIEL TREVISAN RODRIGUES TAQUARITINGA M',
                'usuario': 'FDC371AB',
            },
            'alerta_segmento': 'Selecione pelo menos um segmento'
        }

    }

    return data[target]
