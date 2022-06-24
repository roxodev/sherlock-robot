def factory_vincular_acessos(target):

    data = {

        'vincular_um_acesso': {
            'login': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'lucas.roxo@me.com.br',
                'senha': '123456abc@'
            },

            'acesso': {
                'login': 'B55BDBC2',
                'id': '3643278'
            }
        },

        'vincular_multiplos_acessos': {
            'login': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'lucas.roxo@me.com.br',
                'senha': '123456abc@'
            },

            'acessos': {
                'logins': ['B55BDBC2', '64031391'],
                'ids': ['3643278', '3419201']
            }
        },
    }

    return data[target]
