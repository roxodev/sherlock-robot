def factory_apis(target):

    data = {

        'trunk': {
            'accounts_api': 'https://trunk.me.com.br/do/api/v2/accounts',
            'company_api': 'https://trunk.api.meweb.us.az.miisy.me/company/api/v1/companies',
            'identity_api': 'https://trunk.api.meweb.us.az.miisy.me/identity/api/v1',
            'segment_api': 'https://trunk.api.meweb.us.az.miisy.me/segment/api/v1/segments',
            'supplier_users_api': 'https://trunk.api.meweb.us.az.miisy.me/supplier-user/api/v1/supplierusers',
        }

    }

    return data[target]
