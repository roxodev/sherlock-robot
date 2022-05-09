from faker import Faker
fake = Faker('pt_BR')


def factory_cotacao(target):

    data = {
        'cotacao_livre': {
            # Massa de dados para criação de cotação livre
            'criar_cotacao_livre': {
                'descricao': fake.word(),
                'quantidade': '10',
                'unidade': 'Unidade',
                'aplicacao': 'Consumo',
                'fabricante': fake.company(),
                'codigo': fake.random_number(),
                'complemento': fake.word(),
                'titulo': 'Cotação Teste Marketplace',
                'prazo_resposta': '1 dia',
                'categoria_cotacao': '02 - RFQ',
            },

            'responder_cotacao_livre': {
                'frete': '10',
                'condicao_pagamento': '30 DDL',
                'tipo_frete': 'CIF',
                'nome_contato': fake.first_name(),
                'obs_cabecalho': fake.paragraph(),
                'telefone_contato': '(99)999999999',
                'moeda': 'Real',
                'taxa_conversao': '0',
                'preco_unitario': '100',
                'unidade': 'Unidade',
                'ipi': 'IPI',
                'ipi_aliquota': '0',
                'ipi_incluso': 'Isento',
                'icms_aliquota': '0',
                'icms_incluso': 'Isento',
                'prazo_entrega': '30',
                'fabricante': fake.company(),
                'obs_item': fake.paragraph(),
                'subs_tribut': 'NÃO',
                'subs_tribut_aliquota': '0',
                'pis_aliquota': '0',
                'pis_incluso': 'não',
                'cofins_aliquota': '0',
                'cofins_incluso': 'não',
                'valor_subs_tribut': '0',
                'base_calculo_icms': '100'
            }
        }
    }

    return data[target]
