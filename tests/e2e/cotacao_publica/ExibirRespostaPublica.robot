*Settings
Documentation    Exibir resposta pública

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente Meweb
Test Setup       Iniciar sessão MeWeb
Test Teardown    Capturar evidência

*Test Cases
Exibir resposta pública de fornecedor privado no novo mapa comparativo
    [Tags]    # e2e
    ...       cotacao_publica
    ...       exibir_resposta_publica
    ...       exibir_resposta_publica_novo_mapa

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

Exibir resposta pública de fornecedor privado no mapa comparativo default
    [Tags]    # e2e
    ...       cotacao_publica
    ...       exibir_resposta_publica
    ...       exibir_resposta_publica_mapa_default