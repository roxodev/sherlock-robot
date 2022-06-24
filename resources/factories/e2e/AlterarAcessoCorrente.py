def factory_alterar_acesso_corrente(target):

    data = {

        'alterar_acesso_corrente': {
            'login': {
                'nome': 'VEDANTES E ISOLANTES LIDER',
                'usuario': 'lucas.roxo@me.com.br',
                'senha': '123456abc@'
            },

            'novo_acesso':{
                'nome': 'DATACAD INFORMÁTICA'
            }
        }

    }

    return data[target]
