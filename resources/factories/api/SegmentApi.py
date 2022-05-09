def factory_segment_api(target):

    data = {

        'events': {
            'no_content': 'No Content',
            'unauthorized': 'Unauthorized',
            'page_number': ['Page number must be greater than 0.'],
            'page_size': ['Page size must be greater than 0.'],
            'filter': ['Filter must have at least 3 characters.']
        },

        'get_by_id': {
            'success': {
                'id': 52000000,
                'name': 'Aparelhos Domésticos e Suprimentos e Produtos Eletrônicos de Consumo',
            },

            'no_content': {
                'id': 00000000
            },

            'unauthorized': {
                'id': 52000000
            }

        },

        'get_by_filter': {
            'success': {
                'name': 'Componentes e Suprimentos de Fabricação',
                'id': 31000000
            },

            'unauthorized': {
                'filter': 'Componentes e Suprimentos de Fabricação'
            },
        },

        'search_with_filter': {
            'filter': 'Componentes e Suprimentos de Fabricação',
            'page_number': '1',
            'page_size': '10',

            'success': {
                'response': {
                    'name': 'Componentes e Suprimentos de Fabricação',
                    'id': 31000000
                },
            },

            'bad_request': {
                'filter': 'ac',
                'page_number': '0',
                'page_size': '0',
            }
        }
    }

    return data[target]
