
def factory_adicionar_abrangencia(target):

    data = {

        'atualizar_abrangencia': {
            'login': {
                'nome': 'Amanda Fornecedor SA',
                'usuario': 'B55BDBC2',
            },
            'abrangencia': 'Regional',
        },

        'submeter_sem_abrangencia': {
            'login': {
                'nome': 'Amanda Fornecedor SA',
                'usuario': 'B55BDBC2',
            },
            'alerta_abrangencia': 'Selecione a abrangência'

        }
    }

    return data[target]
