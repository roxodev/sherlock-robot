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
            'complement': '',
            'postalCode': fake.postcode()
        }
    }


def factory_company_api(target):

    data = {

        'get_company': {
            'id': 'db97e1e3-fb3d-4221-b064-e294d8c2caae',
            'name': 'ME',
            'corporateName': 'MERCADO ELETRONICO S.A.',
            'document': {
                    'type': 'Cnpj',
                    'code': '00117351000187'
            },
            'legalStatus': 'Ativo',
            'address': {
                'street': 'R Gomes De Carvalho',
                'number': '1195',
                'neighborhood': 'Vila Olimpia',
                'city': 'São Paulo',
                'country': 'Brasil',
                'province': 'São Paulo',
                'complement': 'CONJ 21 CONJ 22',
                'postalCode': '04.547-004',
                'id': 'bb54a671-d1c8-4e5f-9739-ba7b8898ba1e'
            }
        },

        'get_company_by_document': {
            'documentType': '1',
            'documentCode': '06849537000107',
            'response': {
                'id': 'aaa684cc-852a-4346-800f-1b7557d81047',
                'name': 'Silveira',
                'corporateName': 'Silveira',
                'document': {
                    'type': 'Cnpj',
                    'code': '06849537000107'
                },
                'legalStatus': 'Ativo',
                'address': {
                    'street': 'Estação Yasmin Farias',
                    'number': '920',
                    'neighborhood': 'Mantiqueira',
                    'city': 'Araújo de Cardoso',
                    'country': 'Brasil',
                    'province': 'Mato Grosso do Sul',
                    'complement': '',
                    'postalCode': '96278-916',
                    'id': '04856cec-fe7f-42e3-9c31-0a8ddaf39525'
                }
            }
        },
    }

    return data[target]
