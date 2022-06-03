*Settings
Documentation    Métodos de Cotação Supplier

*Keywords
Acessar oportunidade de negócio
    Preencher campo    ${header}[input_busca]    ${descricao_item}
    Clicar elemento    ${header}[btn_busca]
    Clicar link        ${numero_cotacao}

Ordenar oportunidades de negócios
    [Arguments]    ${tipo_ordenacao}

    Clicar elemento              ${supplier_inbox}[btn_ordenacao]
    Clicar elemento              ${supplier_inbox}[lista_ordenacao] >> text=${tipo_ordenacao}
    Aguardar elemento visível    ${comum}[tbl_grid_me]

Responder Cotação
    # Instanciando massa de dados
    ${responder_cotacao}    Responder Cotacao

    # Validando texto do header do modal de resposta de cotação
    Validar texto igual    ${modal_resp_cota_item}[campo_titulo]    RESPOSTA DE COTAÇÃO    

    # Preenchendo resposta de cotação
    Preencher campo se existente     ${modal_resp_cota_item}[input_frete]                 ${responder_cotacao}[frete]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_condicao_pagamento]    ${responder_cotacao}[condicao_pagamento]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_tipo_frete]            ${responder_cotacao}[tipo_frete]
    Preencher campo se existente     ${modal_resp_cota_item}[input_nome_contato]          ${responder_cotacao}[nome_contato]
    Preencher campo se existente     ${modal_resp_cota_item}[input_obs_cabecalho]         ${responder_cotacao}[obs_cabecalho]
    Preencher campo se existente     ${modal_resp_cota_item}[input_tel_contato]           ${responder_cotacao}[telefone_contato]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_moeda]                 ${responder_cotacao}[moeda]
    Preencher campo se existente     ${modal_resp_cota_item}[input_taxa_conversao]        ${responder_cotacao}[taxa_conversao]

    FOR    ${item}    IN RANGE    1    999999    

    Exit For Loop If    ${item} > ${numero_itens}

    Preencher campo se existente     ${modal_resp_cota_item}[input_preco_unitario]${item}          ${responder_cotacao}[preco_unitario]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_unidade]${item}                 ${responder_cotacao}[unidade]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_ipi]${item}                     ${responder_cotacao}[ipi]
    Preencher campo se existente     ${modal_resp_cota_item}[input_ipi_aliquota]${item}            ${responder_cotacao}[ipi_aliquota]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_ipi_incluso]${item}             ${responder_cotacao}[ipi_incluso]
    Preencher campo se existente     ${modal_resp_cota_item}[input_icms_aliquota]${item}           ${responder_cotacao}[icms_aliquota]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_icms_incluso]${item}            ${responder_cotacao}[icms_incluso]
    Preencher campo se existente     ${modal_resp_cota_item}[input_prazo_entrega]${item}           ${responder_cotacao}[prazo_entrega]
    Preencher campo se existente     ${modal_resp_cota_item}[input_fabricante]${item}              ${responder_cotacao}[fabricante]
    Preencher campo se existente     ${modal_resp_cota_item}[input_obs_item]${item}]               ${responder_cotacao}[obs_item]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_subs_tribut]${item}]            ${responder_cotacao}[subs_tribut]
    Preencher campo se existente     ${modal_resp_cota_item}[input_subs_tribut_aliquota]${item}    ${responder_cotacao}[subs_tribut_aliquota]
    Preencher campo se existente     ${modal_resp_cota_item}[input_pis_aliquota]${item}            ${responder_cotacao}[pis_aliquota]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_pis_incluso]${item}]            ${responder_cotacao}[pis_incluso]
    Preencher campo se existente     ${modal_resp_cota_item}[input_cofins_aliquota]${item}         ${responder_cotacao}[cofins_aliquota]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_cofins_incluso]${item}]         ${responder_cotacao}[cofins_incluso]
    Preencher campo se existente     ${modal_resp_cota_item}[input_valor_subs_tribut]${item}       ${responder_cotacao}[valor_subs_tribut]
    Preencher campo se existente     ${modal_resp_cota_item}[input_base_calculo_icms]${item}       ${responder_cotacao}[base_calculo_icms]

    ${item}    Evaluate    ${item} + 1

    END

    # Submetendo resposta de cotação
    Handle Future Dialogs    action=accept
    Clicar elemento          ${modal_resp_cota_item}[btn_responder]

    # Validando cotação respondida com sucesso
    Validar texto igual    ${modal_resp_cota_item}[banner_resp_cot]    Sua cotação foi respondida com sucesso.
    Clicar elemento        ${modal_resp_cota_item}[btn_continuar]


