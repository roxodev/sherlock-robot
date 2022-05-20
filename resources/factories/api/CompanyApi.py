from faker import Faker
fake = Faker('pt_BR')


def create_company():

    company_name = fake.company()

    return {

        'name': company_name,
        'corporateName': company_name,
        'documentType': 1,
        'documentCode': fake.cnpj(),
        'legalStatus': 1,
        'address': {
            'street': fake.street_name(),
            'number': fake.building_number(),
            'neighborhood': fake.bairro(),
            'city': fake.city(),
            'country': 'Brasil',
            'province': fake.estado_nome(),
            'complement': fake.word(),
            'postalCode': fake.postcode()
        }
    }


def factory_company_api(target):

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
                'name': 'Name is required.',
                'corporateName': 'Corporate name is required.',
                'documentCode': 'Document code is required.',
                'street': 'The Street field is required.',
                'number': 'The Number field is required.',
                'neighborhood': 'The Neighborhood field is required.',
                'city': 'The City field is required.',
                'country': 'The Country field is required.',
                'province': 'The Province field is required.',
                'complement': 'The Complement field is required.',
                'postalCode': 'The PostalCode field is required.',
                'documentType': 'Document type is invalid.'
            }
        },

        'unauthorized': {
            'reason': 'Unauthorized'
        },

        'not_found': {
            'reason': 'Not Found',
        }
    }

    return data[target]