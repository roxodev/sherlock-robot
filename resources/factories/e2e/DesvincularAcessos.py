def factory_desvincular_acessos(target):

    data = {

        'desvincular_um_acesso': {
            'login': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'lucas.roxo@me.com.br',
                'senha': '123456abc@'
            },

            'acesso': {
                'login': 'DATACAD',
                'id': '1847'
            }
        },

        'desvincular_multiplos_acessos': {
            'login': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'lucas.roxo@me.com.br',
                'senha': '123456abc@'
            },

            'acessos': {
                'logins': ['DATACAD', 'FDC371AB'],
                'ids': ['1847', '4027082']
            }
        },

        'desvincular_acesso_corrente': {
            'login': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'lucas.roxo@me.com.br',
                'senha': '123456abc@'
            },

            'acesso': {
                'login': 'VEDANTESLIDER',
                'id': '2729'
            }
        }
    }

    return data[target]
