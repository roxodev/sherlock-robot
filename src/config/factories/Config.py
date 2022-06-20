import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def factory_config(target):

    data = {

        'trunk': {
            'api': {
                'payload_signin': {
                    'username': 'HIPSTER_E2E',
                                'password': 'Trunk123@'
                },

                'payload_auth': {
                    'email': 'lucas.roxo@me.com.br',
                    'password': '123456abc@'
                }
            },

            'e2e': {
                'base_url_keycloak': 'https://trunk.me.com.br/do/SupplierSSO.mvc/auth',
                'base_url_meweb': 'https://trunk.me.com.br/Default.asp',
                'senha_meweb': {
                    'senha': 'qualidade@123',
                    'senha_nova': 'Qualidade@1234',
                },

            },

            'sql': {
                'endpoint': 'https://qa-api-query.mercadoeletronico.com/execute/TRUNK_MEProd',
                'database': 'USE TRUNK_MEProd',
            }

        }
    }

    return data[target]
