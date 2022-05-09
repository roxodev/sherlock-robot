*Settings
Documentation    Métodos de Cotação Buyer

*Keywords
# Criar nova cotação livre
Criar cotação livre
    [Arguments]    ${dados_item}
    ...            ${numero_itens}
    ...            ${fornecedores}
    ...            ${parametros_cotacao}

    # Disponibilizando variáveis
    Set Test Variable    ${dados_item}      
    Set Test Variable    ${numero_itens}

    # Criando nova cotação livre
    Clicar elemento    ${header}[btn_novo]
    Clicar elemento    ${header}[link_cotacao]

    # Preenchendo itens
    FOR    ${item}    IN RANGE    1    999999    

    Exit For Loop If    ${item} > ${numero_itens}

    Preencher campo     ${cotacao_nova_asp}[input_descricao]${item}      ${dados_item}[descricao]
    Preencher campo     ${cotacao_nova_asp}[input_quantidade]${item}     ${dados_item}[quantidade]
    Selecionar opção    ${cotacao_nova_asp}[input_unidade]${item}        ${dados_item}[unidade]
    Selecionar opção    ${cotacao_nova_asp}[input_aplicacao]${item}      ${dados_item}[aplicacao]
    Preencher campo     ${cotacao_nova_asp}[input_fabricante]${item}     ${dados_item}[fabricante]
    Preencher campo     ${cotacao_nova_asp}[input_codigo]${item}         ${dados_item}[codigo]
    Preencher campo     ${cotacao_nova_asp}[input_complemento]${item}    ${dados_item}[complemento]

    ${item}    Evaluate    ${item} + 1

    END

    # Acessando fornecedores privados
    Clicar botão                 Meus Fornecedores
    Aguardar elemento visível    ${comum}[tbl_grid_me]

    # Selecionando fornecedores
    @{fornecedores}    Set Variable    ${fornecedores}

    FOR    ${fornecedor}    IN    @{fornecedores}

    Preencher campo              ${header}[input_busca]                        ${fornecedor}
    Clicar elemento              ${header}[btn_busca]
    Aguardar elemento visível    ${comum}[tbl_grid_me] 
    Clicar elemento via js       ${supplier_search}[input_check_fornecedor]

    END

    # Retornando para cotação
    Clicar botão                 Voltar para cotação
    Aguardar elemento visível    ${comum}[campo_titulo] >> text=RFQ - PARÂMETROS GERAIS

    # Preenchendo parâmetros gerais
    Preencher campo     ${cotacao_nova_asp}[input_titulo]         ${parametros_cotacao}[titulo]
    Selecionar opção    ${cotacao_nova_asp}[input_data_limite]    ${parametros_cotacao}[prazo_resposta]
    Selecionar opção    ${cotacao_nova_asp}[input_cat_cotacao]    ${parametros_cotacao}[categoria_cotacao]

    # Submetendo cotação
    Clicar elemento    ${cotacao_nova_asp}[btn_avancar]
    Clicar elemento    ${cotacao_nova_asp}[btn_finalizar]

    # Validando cotação criada
    ${num_cotacao}=    Get Text    ${comum}[label_codigo_me]

    Validar texto igual    ${comum}[toaster_sucesso]    Cotação nº ${num_cotacao} enviada com sucesso. 
    Set Test Variable      ${num_cotacao}

Acessar cotação
    [Arguments]    ${num_cotacao}

    # Acessar cotação via código me
    Preencher campo    ${header}[input_busca]    ${num_cotacao}
    Clicar elemento    ${header}[btn_busca]
    Clicar link        ${num_cotacao}

Visualizar resposta de cotação
    [Arguments]    ${dados_fornecedor}

    # Validar fornecedor no grid de respostas de cotação
    Validar texto contendo    ${modal_show_cotacao}[tbl_resposta_cotacao]    ${dados_fornecedor}[nome]

Visualizar resposta de cotação no mapa comparativo
    [Arguments]    ${dados_fornecedor}

    # Acessar mapa comparativo
    Clicar elemento              ${modal_show_cotacao}[btn_mapa_comparativo]
    Trocar aba ativa
    Aguardar elemento visível    ${comparative_panel}[tbl_mapa_comparativo]

    # Validar fornecedor no mapa comparativo
    Validar texto contendo    ${comparative_panel}[tbl_mapa_comparativo]    ${dados_fornecedor}[nome]    

Ocultar resposta de cotação
    [Arguments]    ${dados_fornecedor}

    # Validando tooltip do botão ocultar resposta
    Hover                  ${modal_show_cotacao}[btn_ocultar_forn]${dados_fornecedor}[fornecedor][id]
    Validar texto igual    ${dados_fornecedor}[msg_tooltip_btn_ocultar]

    # Ocultando resposta de cotação pública do mapa comparativo
    Clicar elemento    ${modal_show_cotacao}[btn_ocultar_forn]${dados_fornecedor}[fornecedor][id]

Visualizar resposta de cotação oculta no mapa comparativo
    [Arguments]    ${dados_fornecedor}

    # Acessar mapa comparativo
    Clicar elemento              ${modal_show_cotacao}[btn_mapa_comparativo]
    Trocar aba ativa
    Aguardar elemento visível    ${comparative_panel}[tbl_mapa_comparativo]

    # Validar fornecedor oculto no mapa comparativo
    Validar texto não contendo    ${comparative_panel}[tbl_mapa_comparativo]    ${dados_fornecedor}[nome]


