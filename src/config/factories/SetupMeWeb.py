# Configurações e Page Objects MEWeb
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def factory_setup_meweb(target):

    data = {
        'trunk': {
            'base_url_keycloak': 'https://trunk.me.com.br/do/SupplierSSO.mvc/auth',
            'base_url_meweb': 'https://trunk.me.com.br/Default.asp',
            'senha_meweb': {
                'senha': 'qualidade@123',
                'senha_nova': 'Qualidade@1234',
            },
        }
    }

    return data[target]
