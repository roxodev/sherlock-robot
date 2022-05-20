
def factory_setup_api(target):

    data = {

        'trunk': {
            'payload_signin': {
                'username': 'HIPSTER_E2E',
                'password': 'Trunk123@'
            },

            'payload_auth': {
                'email': 'lucas.roxo@me.com.br',
                'password': '123456abc@'
            }

        }
    }

    return data[target]
