def factory_primeiro_acesso_keycloak(target):

    data = {

        'acessos_meweb_relacionados': {
            'login': {
                'nome': 'DATACAD INFORMÁTICA',
                'usuario': 'lucas.roxo@me.com.br',
                'senha': '123456abc@'
            },
        },

        'acessos_meweb_nao_relacionados': {
            'login': {
                'usuario': 'lucas.lncr@gmail.com',
                'senha': '123456abc@'
            },
        }
    }

    return data[target]
