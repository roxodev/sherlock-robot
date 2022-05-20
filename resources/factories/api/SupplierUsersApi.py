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

        'created': {
            'reason': 'Created'
        },

        'success': {
            'reason': 'OK'
        },

        'bad_request': {
            'reason': 'Bad Request',
            'errors': {
                'identityServerUserId': 'Identity Server User Id is required.',
                'meWebUserId': 'MeWebUserId is invalid.',
                'invalidMeWebUserId': 'MeWebUserId is invalid.',
                'notAccessMeWebUserId': 'Supplier user does not have this access.',
                'login': 'Login is required.',
                'name': 'Name is required.',
                'email': 'Email is required.',
            }
        },

        'unauthorized': {
            'reason': 'Unauthorized'
        },

        'not_found': {
            'reason': 'Not Found',
        },

    }

    return data[target]
