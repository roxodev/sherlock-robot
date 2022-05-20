def factory_setup_sql(target):

    data = {

        'trunk': {
            'sql': {
                'endpoint': 'https://qa-api-query.mercadoeletronico.com/execute/TRUNK_MEProd',
                'database': 'USE TRUNK_MEProd',
            }
        }

    }

    return data[target]
