def factory_desvincular_acessos(target):

    data = {

        'desvincular_um_acesso': {
            'login': {
                'usuario': 'lucas.roxo@me.com.br',
                'senha': '123456abc@'

            }
        }
    }

    return data[target]
