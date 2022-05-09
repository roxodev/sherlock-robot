
def factory_segmentos(target):

    data = {

        'primeiro_acesso': {
            'nome': 'DANIEL TREVISAN RODRIGUES TAQUARITINGA M',
            'login': 'FDC371AB',
            'segmentos': ['Acessórios e Bagagem e Produtos de Higiene Pessoal'],
            'abrangencia': 'Nacional',
            'porte': 'Grande Empresa'
        },

        'pai_existente': {
            'nome': 'Amanda Fornecedor SA',
            'login': 'B55BDBC2',
            'segmentos': ['Ferramentas e Máquinas Gerais']
        },

        'pai_nao_existente': {
            'nome': 'Amanda Fornecedor SA',
            'login': 'B55BDBC2',
            'segmentos': ['Acessórios e Bagagem e Produtos de Higiene Pessoal']
        },

        'filho_pai_existente': {
            'nome': 'Amanda Fornecedor SA',
            'login': 'B55BDBC2',
            'segmentos_pai': ['Ferramentas e Máquinas Gerais'],
            'segmentos_filho': ['Máquinas e equipamentos pneumáticos']
        },

        'filho_pai_nao_existente': {
            'nome': 'Amanda Fornecedor SA',
            'login': 'B55BDBC2',
            'segmentos_pai': ['Tecnologia da Informação, Difusão e Telecomunicações'],
            'segmentos_filho': ['Equipamentos e acessórios de computador'],

        },

        'atualizar_abrangencia': {
            'nome': 'Amanda Fornecedor SA',
            'login': 'B55BDBC2',
            'abrangencia': 'Regional',
        },

        'excluir_segmentos': {
            'nome': 'Amanda Fornecedor SA',
            'login': 'B55BDBC2',
            'msg_confirma_excluir_segmento': 'Você tem certeza de eliminar o Segmento',
            'msg_alerta_excluir_segmento': 'Você precisa ter ao menos 1 segmento selecionado.'
        }



    }

    return data[target]
