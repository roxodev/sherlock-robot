*Settings
Documentation    Setup PO_MEWEB

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
Configurar ambiente MeWeb
    # Definindo configurações de ambiente
    ${PO_MEWEB}       Factory PO MEWEB       ${env}
    ${SETUP_MEWEB}    Factory Setup MEWEB    ${env}
    ${SETUP_SQL}      Factory Setup SQL      ${env}

    # Instanciando configurações meweb
    ${base_url}=    Set Variable    ${SETUP_MEWEB}[base_url]
    ${senha}=       Set Variable    ${SETUP_MEWEB}[senha]

    # Instanciando configurações sql
    ${sql}=    Set Variable    ${SETUP_SQL}[sql]

    # Instanciando page objects
    ${card_perfil}=                       Set Variable    ${PO_MEWEB}[card_perfil]
    ${comparative_panel}=                 Set Variable    ${PO_MEWEB}[comparative_panel]
    ${comum}=                             Set Variable    ${PO_MEWEB}[comum]                             
    ${cotacao_nova_asp}=                  Set Variable    ${PO_MEWEB}[cotacao_nova_asp]
    ${default_asp}=                       Set Variable    ${PO_MEWEB}[default_asp]
    ${header}=                            Set Variable    ${PO_MEWEB}[header]
    ${home_transactions}=                 Set Variable    ${PO_MEWEB}[home_transactions]
    ${mercado_compras}=                   Set Variable    ${PO_MEWEB}[mercado_compras]
    ${modal_mapa_comparativo_default}=    Set Variable    ${PO_MEWEB}[modal_mapa_comparativo_default]
    ${modal_resp_cota_item}=              Set Variable    ${PO_MEWEB}[modal_resp_cota_item]
    ${modal_novidades_segmentos}=         Set Variable    ${PO_MEWEB}[modal_novidades_segmentos]
    ${modal_show_cotacao}=                Set Variable    ${PO_MEWEB}[modal_show_cotacao]
    ${muda_senha_asp}=                    Set Variable    ${PO_MEWEB}[muda_senha_asp]
    ${supplier_info}=                     Set Variable    ${PO_MEWEB}[supplier_info]
    ${supplier_register}=                 Set Variable    ${PO_MEWEB}[supplier_register]
    ${supplier_segments}=                 Set Variable    ${PO_MEWEB}[supplier_segments]
    ${supplier_segments_add}=             Set Variable    ${PO_MEWEB}[supplier_segments_add]
    ${supplier_search}=                   Set Variable    ${PO_MEWEB}[supplier_search]
    ${supplier_inbox}=                    Set Variable    ${PO_MEWEB}[supplier_inbox]
    ${timezone_mvc}=                      Set Variable    ${PO_MEWEB}[timezone_mvc]

    # Disponibilizando configurações meweb
    Set Global Variable    ${base_url}
    Set Global Variable    ${senha}

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
    Set Global Variable    ${timezone_mvc}

    # Executando queries de configuração de ambiente
    Atualizar usuários MeWeb
    Atualizar política RFQ
    Excluir segmentos e abrangência
    Incluir segmentos e abrangência

Iniciar sessão MeWeb
    # Definindo browser timeout
    Set Browser timeout    20

    # Intanciando sessão no chromium
    New Browser    chromium
    ...            headless=${headless}
    ...            slowMo=00:00:00.5

    # Abrindo página inicial
    New Page             ${base_url}
    Set Viewport Size    1280
    ...                  720

Capturar evidência
    # Definindo hashname para as evidências
    ${screenshot_name}    Screenshot Name

    # Capturando evidência
    Take Screenshot    fullPage=True                  
    ...                filename=${screenshot_name}