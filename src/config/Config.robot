*Settings
Documentation    Configurações de Ambiente

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
Configurar ambiente
    # Definindo configurações de APIs
    ${APIS}        Factory APIs        ${env}
    ${CONFIG}      Factory Config      ${env}
    ${PO_MEWEB}    Factory PO MEWEB    ${env}

    # Instanciando APIs
    ${accounts_api}=          Set Variable    ${APIS}[accounts_api]
    ${company_api}=           Set Variable    ${APIS}[company_api]
    ${identity_api}=          Set Variable    ${APIS}[identity_api]
    ${segment_api}=           Set Variable    ${APIS}[segment_api]
    ${supplier_users_api}=    Set Variable    ${APIS}[supplier_users_api]

    # Instanciando payloads para captura de access token
    ${payload_signin}=    Set Variable    ${CONFIG}[api][payload_signin]
    ${payload_auth}=      Set Variable    ${CONFIG}[api][payload_auth]

    # Disponibilizando APIs
    Set Global Variable    ${accounts_api}
    Set Global Variable    ${company_api}
    Set Global Variable    ${identity_api}
    Set Global Variable    ${segment_api}
    Set Global Variable    ${supplier_users_api}

    # Disponibilizando payloads para captura de access token
    Set Global Variable    ${payload_signin}
    Set Global Variable    ${payload_auth}

    # Instanciando configurações meweb
    ${base_url_keycloak}=    Set Variable    ${CONFIG}[e2e][base_url_keycloak]
    ${base_url_meweb}=       Set Variable    ${CONFIG}[e2e][base_url_meweb]
    ${senha_meweb}=          Set Variable    ${CONFIG}[e2e][senha_meweb]

    # Instanciando configurações sql
    ${sql}=    Set Variable    ${CONFIG}[sql]

    # Instanciando page objects
    ${card_perfil}=                            Set Variable    ${PO_MEWEB}[card_perfil]
    ${comparative_panel}=                      Set Variable    ${PO_MEWEB}[comparative_panel]
    ${comum}=                                  Set Variable    ${PO_MEWEB}[comum]                                  
    ${cotacao_nova_asp}=                       Set Variable    ${PO_MEWEB}[cotacao_nova_asp]
    ${default_asp}=                            Set Variable    ${PO_MEWEB}[default_asp]
    ${header}=                                 Set Variable    ${PO_MEWEB}[header]
    ${home_transactions}=                      Set Variable    ${PO_MEWEB}[home_transactions]
    ${mercado_compras}=                        Set Variable    ${PO_MEWEB}[mercado_compras]
    ${modal_mapa_comparativo_default}=         Set Variable    ${PO_MEWEB}[modal_mapa_comparativo_default]
    ${modal_resp_cota_item}=                   Set Variable    ${PO_MEWEB}[modal_resp_cota_item]
    ${modal_novidades_segmentos}=              Set Variable    ${PO_MEWEB}[modal_novidades_segmentos]
    ${modal_show_cotacao}=                     Set Variable    ${PO_MEWEB}[modal_show_cotacao]
    ${muda_senha_asp}=                         Set Variable    ${PO_MEWEB}[muda_senha_asp]
    ${supplier_info}=                          Set Variable    ${PO_MEWEB}[supplier_info]
    ${supplier_register}=                      Set Variable    ${PO_MEWEB}[supplier_register]
    ${supplier_segments}=                      Set Variable    ${PO_MEWEB}[supplier_segments]
    ${supplier_segments_add}=                  Set Variable    ${PO_MEWEB}[supplier_segments_add]
    ${supplier_search}=                        Set Variable    ${PO_MEWEB}[supplier_search]
    ${supplier_inbox}=                         Set Variable    ${PO_MEWEB}[supplier_inbox]
    ${supplier_sso_auth}=                      Set Variable    ${PO_MEWEB}[supplier_sso_auth]
    ${supplier_user}=                          Set Variable    ${PO_MEWEB}[supplier_user]
    ${supplier_user_first_access}=             Set Variable    ${PO_MEWEB}[supplier_user_first_access]
    ${supplier_user_first_access_relation}=    Set Variable    ${PO_MEWEB}[supplier_user_first_access_relation]
    ${timezone_mvc}=                           Set Variable    ${PO_MEWEB}[timezone_mvc]

    # Disponibilizando configurações meweb
    Set Global Variable    ${base_url_keycloak}
    Set Global Variable    ${base_url_meweb}
    Set Global Variable    ${senha_meweb}

    # Disponibilizando configurações sql
    Set Global Variable    ${sql}

    # Disponibilizando page objects
    Set Global Variable    ${card_perfil}
    Set Global Variable    ${comparative_panel}
    Set Global Variable    ${comum}
    Set Global Variable    ${cotacao_nova_asp}
    Set Global Variable    ${default_asp}
    Set Global Variable    ${header}
    Set Global Variable    ${home_transactions}
    Set Global Variable    ${mercado_compras}
    Set Global Variable    ${modal_mapa_comparativo_default}
    Set Global Variable    ${modal_resp_cota_item}
    Set Global Variable    ${modal_novidades_segmentos}
    Set Global Variable    ${modal_show_cotacao}
    Set Global Variable    ${muda_senha_asp}
    Set Global Variable    ${supplier_info}
    Set Global Variable    ${supplier_register}
    Set Global Variable    ${supplier_segments}
    Set Global Variable    ${supplier_segments_add}
    Set Global Variable    ${supplier_search}
    Set Global Variable    ${supplier_inbox}
    Set Global Variable    ${supplier_sso_auth}
    Set Global Variable    ${supplier_user}
    Set Global Variable    ${supplier_user_first_access}
    Set Global Variable    ${supplier_user_first_access_relation}
    Set Global Variable    ${timezone_mvc}

    # Executando queries de configuração de ambiente
    Atualizar usuários MeWeb
    Atualizar política RFQ
    Excluir segmentos e abrangência
    Incluir segmentos e abrangência

Capturar access token meweb
    POST API    ${accounts_api}/signin
    ...         ${empty}
    ...         ${payload_signin}
    ...         200

    # recuperando token de acesso
    ${access_token}    Set Variable    ${response.json()}[accessToken]

    # Disponiblizando token de acesso
    Set Global Variable    ${access_token}

    # Definindo headers
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Disponiblizando header
    Set Global Variable    ${headers}

Capturar access token keycloak
    POST API    ${identity_api}/auth
    ...         ${empty}
    ...         ${payload_auth}
    ...         200

    # Recuperando token de acesso
    ${access_token}    Set Variable    ${response.json()}[access_token]

    # Disponiblizando token de acesso
    Set Global Variable    ${access_token}

    # Definindo headers
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Disponiblizando header
    Set Global Variable    ${headers}