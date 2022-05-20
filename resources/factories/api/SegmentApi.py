def factory_segment_api(target):

    data = {

        'success': {
            'reason': 'OK'
        },

        'unauthorized': {
            'reason': 'Unauthorized'
        },

        'no_content': {
            'reason': 'No Content',
        },

        'bad_request': {
            'reason': 'Bad Request',
            'errors': {
                'pageNumber': 'Page number must be greater than 0.',
                'pageSize': 'Page size must be greater than 0.',
                'filter': 'Filter must have at least 3 characters.'

            }
        }
    }

    return data[target]
