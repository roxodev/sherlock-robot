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
    ${ocultar_resposta_novo_mapa}    Factory Ocultar Resposta Publica    ocultar_resposta_publica_mapa_comparativo

    Login MEWeb                                                    ${ocultar_resposta_novo_mapa}[dados_comprador]
    Criar cotação livre                                            1                                                    
    ...                                                            ${ocultar_resposta_novo_mapa}[lista_fornecedores]    
    Logoff MEWeb
    Login MEWeb                                                    ${ocultar_resposta_novo_mapa}[dados_fornecedor]
    Clicar botão                                                   Oportunidades de Negócios
    Acessar oportunidade de negócio                                
    Responder cotação                                              
    Logoff MEWeb
    Login MEWeb                                                    ${ocultar_resposta_novo_mapa}[dados_comprador]
    Acessar cotação                                                ${numero_cotacao}
    Validar resposta de cotação                                    ${ocultar_resposta_novo_mapa}[dados_fornecedor]
    Ocultar resposta de cotação                                    ${ocultar_resposta_novo_mapa}[dados_fornecedor]
    Validar resposta de cotação oculta no novo mapa comparativo    ${ocultar_resposta_novo_mapa}[dados_fornecedor]

Ocultar resposta pública de fornecedor privado no mapa comparativo default
    [Tags]    e2e
    ...       cotacao_publica
    ...       ocultar_resposta_publica
    ...       ocultar_resposta_publica_mapa_default

        # Instanciando massa de dados
    ${ocultar_resposta_mapa_default}    Factory Ocultar Resposta Publica    ocultar_resposta_publica_mapa_comparativo

    Login MEWeb                                                    ${ocultar_resposta_mapa_default}[dados_comprador]
    Criar cotação livre                                            1                                                       
    ...                                                            ${ocultar_resposta_mapa_default}[lista_fornecedores]    
    Logoff MEWeb
    Login MEWeb                                                    ${ocultar_resposta_mapa_default}[dados_fornecedor]
    Clicar botão                                                   Oportunidades de Negócios
    Acessar oportunidade de negócio                                
    Responder cotação                                              
    Logoff MEWeb
    Login MEWeb                                                    ${ocultar_resposta_mapa_default}[dados_comprador]
    Acessar cotação                                                ${numero_cotacao}
    Validar resposta de cotação                                    ${ocultar_resposta_mapa_default}[dados_fornecedor]
    Ocultar resposta de cotação                                    ${ocultar_resposta_mapa_default}[dados_fornecedor]
    Validar resposta de cotação oculta mapa comparativo default    ${ocultar_resposta_mapa_default}[dados_fornecedor]