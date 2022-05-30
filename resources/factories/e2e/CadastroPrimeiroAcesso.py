def factory_primeiro_acesso(target):

    data = {

        'primeiro_acesso': {
            'login': {
                'nome': 'DANIEL TREVISAN RODRIGUES TAQUARITINGA M',
                'usuario': 'FDC371AB',
            },
            'segmento': 'Acessórios e Bagagem e Produtos de Higiene Pessoal',
            'abrangencia': 'Nacional',
        },

        'submeter_sem_segmentos': {
            'login': {
                'nome': 'DATACAD INFORMÁTICA',
                'usuario': 'DATACAD',
            },
            'abrangencia': 'Nacional',
            'alerta_segmento': 'Selecione pelo menos um segmento'
        },

        'submeter_sem_abrangencia': {
            'login': {
                'nome': 'DATACAD INFORMÁTICA',
                'usuario': 'DATACAD',
            },
            'segmento': 'Acessórios e Bagagem e Produtos de Higiene Pessoal',
            'alerta_abrangencia': 'Selecione a abrangência'

        }

    }

    return data[target]
