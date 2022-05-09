*Settings
Documentation    Métodos de Cotação Supplier

*Keywords
# Criar nova cotação livre
Acessar oportunidade de negócio
    [Arguments]    ${descr_item}

    # Buscar oportunidades de negócio
    Clicar botão       Oportunidades de Negócios
    Preencher campo    ${header}[input_busca]       ${descr_item}
    Clicar elemento    ${header}[btn_busca]
    Clicar link        ${num_cotacao}

Responder Cotação
    [Arguments]    ${resposta_cotacao}

    # Validando texto do header do modal de resposta de cotação
    Validar texto igual    ${modal_resp_cota_item}[campo_titulo]    RESPOSTA DE COTAÇÃO    

    # Preenchendo resposta de cotação
    Preencher campo se existente     ${modal_resp_cota_item}[input_frete]                 ${resposta_cotacao}[frete]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_condicao_pagamento]    ${resposta_cotacao}[condicao_pagamento]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_tipo_frete]            ${resposta_cotacao}[tipo_frete]
    Preencher campo se existente     ${modal_resp_cota_item}[input_nome_contato]          ${resposta_cotacao}[nome_contato]
    Preencher campo se existente     ${modal_resp_cota_item}[input_obs_cabecalho]         ${resposta_cotacao}[obs_cabecalho]
    Preencher campo se existente     ${modal_resp_cota_item}[input_tel_contato]           ${resposta_cotacao}[telefone_contato]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_moeda]                 ${resposta_cotacao}[moeda]
    Preencher campo se existente     ${modal_resp_cota_item}[input_taxa_conversao]        ${resposta_cotacao}[taxa_conversao]

    FOR    ${item}    IN RANGE    1    999999    

    Exit For Loop If    ${item} > ${numero_itens}

    Preencher campo se existente     ${modal_resp_cota_item}[input_preco_unitario]${item}          ${resposta_cotacao}[preco_unitario]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_unidade]${item}                 ${resposta_cotacao}[unidade]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_ipi]${item}                     ${resposta_cotacao}[ipi]
    Preencher campo se existente     ${modal_resp_cota_item}[input_ipi_aliquota]${item}            ${resposta_cotacao}[ipi_aliquota]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_ipi_incluso]${item}             ${resposta_cotacao}[ipi_incluso]
    Preencher campo se existente     ${modal_resp_cota_item}[input_icms_aliquota]${item}           ${resposta_cotacao}[icms_aliquota]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_icms_incluso]${item}            ${resposta_cotacao}[icms_incluso]
    Preencher campo se existente     ${modal_resp_cota_item}[input_prazo_entrega]${item}           ${resposta_cotacao}[prazo_entrega]
    Preencher campo se existente     ${modal_resp_cota_item}[input_fabricante]${item}              ${resposta_cotacao}[fabricante]
    Preencher campo se existente     ${modal_resp_cota_item}[input_obs_item]${item}]               ${resposta_cotacao}[obs_item]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_subs_tribut]${item}]            ${resposta_cotacao}[subs_tribut]
    Preencher campo se existente     ${modal_resp_cota_item}[input_subs_tribut_aliquota]${item}    ${resposta_cotacao}[subs_tribut_aliquota]
    Preencher campo se existente     ${modal_resp_cota_item}[input_pis_aliquota]${item}            ${resposta_cotacao}[pis_aliquota]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_pis_incluso]${item}]            ${resposta_cotacao}[pis_incluso]
    Preencher campo se existente     ${modal_resp_cota_item}[input_cofins_aliquota]${item}         ${resposta_cotacao}[cofins_aliquota]
    Selecionar opção se existente    ${modal_resp_cota_item}[input_cofins_incluso]${item}]         ${resposta_cotacao}[cofins_incluso]
    Preencher campo se existente     ${modal_resp_cota_item}[input_valor_subs_tribut]${item}       ${resposta_cotacao}[valor_subs_tribut]
    Preencher campo se existente     ${modal_resp_cota_item}[input_base_calculo_icms]${item}       ${resposta_cotacao}[base_calculo_icms]

    ${item}    Evaluate    ${item} + 1

    END

    # Submetendo resposta de cotação
    Handle Future Dialogs    action=accept
    Clicar elemento          ${modal_resp_cota_item}[btn_responder]

    # Validando cotação respondida com sucesso
    Validar texto igual    ${modal_resp_cota_item}[banner_resp_cot]    Sua cotação foi respondida com sucesso.
    Clicar elemento        ${modal_resp_cota_item}[btn_continuar]


