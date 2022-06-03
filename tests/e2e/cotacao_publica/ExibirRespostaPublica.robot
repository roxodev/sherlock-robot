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
    [Tags]    e2e
    ...       cotacao_publica
    ...       exibir_resposta_publica
    ...       exibir_resposta_publica_novo_mapa

    # Instanciando massa de dados
    ${exibir_resposta_novo_mapa}    Factory Exibir Resposta Publica    exibir_resposta_novo_mapa


    Login MEWeb                                                ${exibir_resposta_novo_mapa}[dados_comprador]
    Criar cotação livre                                        1                                                   
    ...                                                        ${exibir_resposta_novo_mapa}[lista_fornecedores]    
    Logoff MEWeb
    Login MEWeb                                                ${exibir_resposta_novo_mapa}[dados_fornecedor]
    Clicar botão                                               Oportunidades de Negócios
    Acessar oportunidade de negócio                             
    Responder cotação                                          
    Logoff MEWeb
    Login MEWeb                                                ${exibir_resposta_novo_mapa}[dados_comprador]
    Acessar cotação                                            ${numero_cotacao}
    Validar resposta de cotação                                ${exibir_resposta_novo_mapa}[dados_fornecedor]
    Visualizar resposta de cotação no novo mapa comparativo    ${exibir_resposta_novo_mapa}[dados_fornecedor]      

Exibir resposta pública de fornecedor privado no mapa comparativo default
    [Tags]    # e2e
    ...       cotacao_publica
    ...       exibir_resposta_publica
    ...       exibir_resposta_publica_mapa_default