*Settings
Documentation    Cotação Pública

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente MeWeb
Test Setup       Iniciar sessão MeWeb
Test Teardown    Capturar evidência

*Test Cases

*Keywords
# Cria cotação livre
Criar cotação pública
    [Arguments]    ${fornecedores_cotacao}
    ...            ${dados_cotacao}
    ...            ${numero_itens}            

    # Criando cotação livre
    Criar cotação livre    ${dados_cotacao}[criar_cotacao_livre]
    ...                    ${numero_itens}                          
    ...                    ${fornecedores_cotacao}[fornecedores]
    ...                    ${dados_cotacao}[criar_cotacao_livre]

Responder cotação pública
    [Arguments]    ${dados_cotacao}    

    # Respondendo cotação livre
    Acessar oportunidade de negócio    ${dados_item}[descricao]
    Responder cotação                  ${dados_cotacao}[responder_cotacao_livre]

# Validar card do fornecedor no mapa comparativo
Visualizar resposta pública no mapa comparativo
    [Arguments]    ${dados_fornecedor}

    Acessar cotação                                       ${num_cotacao}
    Visualizar resposta de cotação                        ${dados_fornecedor}[fornecedor]
    Visualizar resposta de cotação no mapa comparativo    ${dados_fornecedor}[fornecedor]

# Oculta resposta pública do mapa comparativo
Ocultar resposta pública no mapa comparativo
    [Arguments]    ${dados_fornecedor}

    Acessar cotação                                              ${num_cotacao}
    Visualizar resposta de cotação                               ${dados_fornecedor}[fornecedor]    
    Ocultar resposta de cotação                                  ${dados_fornecedor}
    Visualizar resposta de cotação oculta no mapa comparativo    ${dados_fornecedor}[fornecedor]