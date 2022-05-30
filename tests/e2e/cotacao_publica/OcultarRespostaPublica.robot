*Settings
Documentation    Ocultar resposta pública

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente Meweb
Test Setup       Iniciar sessão MeWeb
Test Teardown    Capturar evidência

*Test Cases
Ocultar resposta pública de fornecedor privado no novo mapa comparativo
    [Tags]    # e2e
    ...       cotacao_publica
    ...       ocultar_resposta_publica
    ...       ocultar_resposta_publica_novo_mapa

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

Ocultar resposta pública de fornecedor privado no mapa comparativo default
    [Tags]    # e2e
    ...       cotacao_publica
    ...       ocultar_resposta_publica
    ...       ocultar_resposta_publica_mapa_default