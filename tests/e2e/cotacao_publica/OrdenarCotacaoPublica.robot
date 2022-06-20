*Settings
Documentation    Ordenar cotação pública

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão               ${base_url_meweb}
Test Teardown    Capturar evidência

*Test Cases
Ordenar cotações públicas mais relevantes
    [Tags]    e2e
    ...       cotacao_publica
    ...       ordenar_cotacao_publica
    ...       ordenar_cotacao_publica_mais_relevantes

    # Instanciando massa de dados
    ${ordenar_mais_relevantes}    Factory Ordenar Cotacao Publica

    Login MEWeb     ${ordenar_mais_relevantes}[dados_fornecedor]
    Clicar botão    Ir para Oportunidades de Negócios

    # Capturando imagem do grid pré ordenação
    ${linha_grid}=    Get text    ${comum}[linha_grid_me]

    Ordenar oportunidades de negócios    Mais relevantes
    Validar texto igual                  ${comum}[linha_grid_me]    ${linha_grid}

Ordenar cotações públicas criadas recentemente
    [Tags]    e2e
    ...       cotacao_publica
    ...       ordenar_cotacao_publica
    ...       ordenar_cotacao_publica_criadas_recentemente

    # Instanciando massa de dados
    ${ordenar_criadas_recentemente}    Factory Ordenar Cotacao Publica

    Login MEWeb     ${ordenar_criadas_recentemente}[dados_fornecedor]
    Clicar botão    Ir para Oportunidades de Negócios

    # Capturando imagem do grid pré ordenação
    ${linha_grid}=    Get text    ${comum}[linha_grid_me]

    Ordenar oportunidades de negócios    Criadas recentemente
    Validar texto diferente              ${comum}[linha_grid_me]    ${linha_grid}


Ordenar cotações públicas próximas ao vencimento
    [Tags]    e2e
    ...       cotacao_publica
    ...       ordenar_cotacao_publica
    ...       ordenar_cotacao_publica_proximas_vencimento

    # Instanciando massa de dados
    ${ordenar_proximas_vencimento}    Factory Ordenar Cotacao Publica

    Login MEWeb     ${ordenar_proximas_vencimento}[dados_fornecedor]
    Clicar botão    Ir para Oportunidades de Negócios

    # Capturando imagem do grid pré ordenação
    ${linha_grid}=    Get text    ${comum}[linha_grid_me]

    Ordenar oportunidades de negócios    Próximas ao vencimento
    Validar texto diferente              ${comum}[linha_grid_me]    ${linha_grid}