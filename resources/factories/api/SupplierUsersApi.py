from string import digits
from faker import Faker
fake = Faker('pt_BR')


def create_supplier():

    return {

        'identityServerUserId': fake.uuid4(),
        'name': fake.company(),
        'email': fake.email(),
    }


def create_supplier_access():

    return {

        'meWebUserId': fake.random_number(digits=4),
        'login': fake.user_name()

    }


def update_supplier():

    return {

        'name': fake.company(),
        'accesses': [
            {
                'meWebUserId': fake.random_number(digits=4),
                'login': fake.user_name()
            }
        ]
    }


def factory_supplier_users_api(target):

    data = {

        'events': {
            'identityServerUserId': ['Identity Server User Id is required.'],
            'meWebUserId': ['MeWebUserId is invalid.'],
            'title': 'Supplier user does not have this access.',
            'login': ['Login is required.'],
            'name': ['Name is required.'],
            'email': ['Email is required.'],
            'unauthorized':  'Unauthorized',
            'not_found': 'Not Found',

        },

        'get_supplier': {
            'success': {
                'uuid': 'd714faaf-af05-4590-86c9-1dbd94a1088f',
                'response': {
                    'identityServerUserId': 'd714faaf-af05-4590-86c9-1dbd94a1088f',
                    'name': 'Lucas Roxo',
                    'email': 'lucas.roxo@me.com.br',
                },
            },

            'unauthorized': {
                'uuid': 'd714faaf-af05-4590-86c9-1dbd94a1088f'
            },

            'not_found': {
                'uuid': 'a0144c8d-a0dc-4296-becd-769f458cfa1e',
            }


        },

        'get_accesses': {
            'success': {
                'uuid': 'd714faaf-af05-4590-86c9-1dbd94a1088f',
                'response': [
                    {
                        'meWebUserId': 3643278,
                        'login': 'B55BDBC2',
                    },
                    {
                        'meWebUserId': 4027082,
                        'login': 'FDC371AB',
                    }
                ],
            },

            'unauthorized': {
                'uuid': 'd714faaf-af05-4590-86c9-1dbd94a1088f',
            },

            'not_found': {
                'uuid': 'a0144c8d-a0dc-4296-becd-769f458cfa1e',
            },
        },

        'delete_access': {
            'not_found': {
                'meWebUserId': 1234,
            }
        },

        'delete_supplier': {
            'unauthorized': {
                'uuid': '3fa85f64-5717-4562-b3fc-2c963f66afa',
            },

            'not_found': {
                'uuid': 'a0144c8d-a0dc-4296-becd-769f458cfa1e',
            },
        },

        'enable_supplier': {
            'bad_request': {
                'uuid': '00000000-0000-0000-0000-000000000000',
            },

        },

        'create_access': {
            'bad_request': {
                'meWebUserId': 0,
                'uuid': '00000000-0000-0000-0000-000000000000'
            }
        },

        'return_users': {
            'email': 'lucas.roxo@me.com.br',
            'response': {
                'supplierUserRelation': [
                    {
                        'userId': 3643278,
                        'userType': 1,
                        'email': 'lucas.roxo@me.com.br',
                        'document': '41723886000189',
                        'documentType': 1
                    },
                    {
                        'userId': 4027082,
                        'userType': 1,
                        'email': 'lucas.roxo@me.com.br',
                        'document': '04432208000130',
                        'documentType': 1
                    }
                ]
            }
        },

        'return_buyers': {
            'payload': {
                'document': '41723886000189',
                'email': 'lucas.roxo@me.com.br',
            },

            'response': [
                {
                    'userId': 3643278,
                    'document': '41723886000189',
                    'login': 'B55BDBC2',
                    'name': 'Amanda Fornecedor SA',
                    'email': 'lucas.roxo@me.com.br',
                    'hits': 1,
                    'supplierUserBuyers': [
                        {
                            'buyerId': 1804160,
                            'buyerName': 'Demonstração FAST'
                        }
                    ]
                }
            ]

        },

        'set_current_user': {
            'bad_request': {
                'invalidMeWebUserId': 0,
                'notAccessMeWebUserId': 1234
            }

        },

        'update_supplier': {
            'bad_request': {
                'uuid': '00000000-0000-0000-0000-000000000000'
            }
        }

    }

    return data[target]
