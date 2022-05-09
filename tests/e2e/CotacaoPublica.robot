*Settings
Documentation    Cotação Pública

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente MeWeb
Test Setup       Iniciar sessão MeWeb
Test Teardown    Capturar evidência

*Test Cases
Exibir resposta pública no mapa comparativo automaticamente
    [Tags]    # e2e
    ...       cotacao_publica
    ...       exibir_resposta

    # Instanciando massa de dados
    ${exibir_resposta}    Factory Cotacao Publica    exibir_resposta
    ${cotacao_livre}      Factory Cotacao            cotacao_livre

    Login MEWeb                                        ${exibir_resposta}[comprador]
    Criar cotação pública                              ${exibir_resposta}                
    ...                                                ${cotacao_livre}
    ...                                                1
    Logoff MEWeb
    Login MEWeb                                        ${exibir_resposta}[fornecedor]
    Responder cotação pública                          ${cotacao_livre}
    Logoff MEWeb
    Login MEWeb                                        ${exibir_resposta}[comprador]
    Visualizar resposta pública no mapa comparativo    ${exibir_resposta}

Ocultar resposta pública do mapa comparativo
    [Tags]    # e2e
    ...       cotacao_publica
    ...       ocultar_resposta

    # Instanciando massa de dados
    ${ocultar_resposta}    Factory Cotacao Publica    ocultar_resposta
    ${cotacao_livre}       Factory Cotacao            cotacao_livre

    Login MEWeb                                     ${ocultar_resposta}[comprador]
    Criar cotação pública                           ${ocultar_resposta}                
    ...                                             ${cotacao_livre}
    ...                                             1
    Logoff MEWeb
    Login MEWeb                                     ${ocultar_resposta}[fornecedor]
    Responder cotação pública                       ${cotacao_livre}
    Logoff MEWeb
    Login MEWeb                                     ${ocultar_resposta}[comprador]
    Ocultar resposta pública no mapa comparativo    ${ocultar_resposta}


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