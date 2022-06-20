*Settings
Documentation    Métodos de Cotação Buyer

*Keywords
# Criar nova cotação livre
Criar cotação livre
    [Arguments]    ${numero_itens}
    ...            ${lista_fornecedores}

    # Instanciando massa de dados
    ${criar_cotacao_livre}    Criar Cotacao Livre

    # Disponibilizando variáveis
    Set Global Variable    ${numero_itens}

    # Criando nova cotação livre
    Clicar elemento    ${header}[btn_novo]
    Clicar elemento    ${header}[link_cotacao]

    # Preenchendo itens
    FOR    ${item}    IN RANGE    1    999999    

    Exit For Loop If    ${item} > ${numero_itens}

    Preencher campo     ${cotacao_nova_asp}[input_descricao]${item}      ${criar_cotacao_livre}[descricao]
    Preencher campo     ${cotacao_nova_asp}[input_quantidade]${item}     ${criar_cotacao_livre}[quantidade]
    Selecionar opção    ${cotacao_nova_asp}[input_unidade]${item}        ${criar_cotacao_livre}[unidade]
    Selecionar opção    ${cotacao_nova_asp}[input_aplicacao]${item}      ${criar_cotacao_livre}[aplicacao]
    Preencher campo     ${cotacao_nova_asp}[input_fabricante]${item}     ${criar_cotacao_livre}[fabricante]
    Preencher campo     ${cotacao_nova_asp}[input_codigo]${item}         ${criar_cotacao_livre}[codigo]
    Preencher campo     ${cotacao_nova_asp}[input_complemento]${item}    ${criar_cotacao_livre}[complemento]

    ${item}    Evaluate    ${item} + 1

    END

    # Acessando fornecedores privados
    Clicar botão                 Meus Fornecedores
    Aguardar elemento visível    ${comum}[tbl_grid_me]

    # Selecionando fornecedores
    @{lista_fornecedores}    Set Variable    ${lista_fornecedores}

    FOR    ${fornecedor}    IN    @{lista_fornecedores}

    Preencher campo              ${header}[input_busca]                        ${fornecedor}
    Clicar elemento              ${header}[btn_busca]
    Aguardar elemento visível    ${comum}[tbl_grid_me] 
    Clicar elemento via js       ${supplier_search}[input_check_fornecedor]

    END

    # Retornando para cotação
    Clicar botão                 Voltar para cotação
    Aguardar elemento visível    ${comum}[campo_titulo] >> text=RFQ - PARÂMETROS GERAIS

    # Preenchendo parâmetros gerais
    Preencher campo     ${cotacao_nova_asp}[input_titulo]         ${criar_cotacao_livre}[titulo]
    Selecionar opção    ${cotacao_nova_asp}[input_data_limite]    ${criar_cotacao_livre}[prazo_resposta]
    Selecionar opção    ${cotacao_nova_asp}[input_cat_cotacao]    ${criar_cotacao_livre}[categoria_cotacao]

    # Submetendo cotação
    Clicar elemento    ${cotacao_nova_asp}[btn_avancar]
    Clicar elemento    ${cotacao_nova_asp}[btn_finalizar]

    # Validando cotação criada
    ${numero_cotacao}=     Get Text                     ${comum}[label_codigo_me]
    Validar texto igual    ${comum}[toaster_sucesso]    Cotação nº ${numero_cotacao} enviada com sucesso. 

    # Definindo descrição de item para consulta
    ${descricao_item}    Set Variable    ${criar_cotacao_livre}[descricao]

    # Disponibilizando variáveis de teste
    Set Global Variable    ${numero_cotacao}
    Set Global Variable    ${descricao_item}

Acessar cotação
    [Arguments]    ${numero_cotacao}

    # Acessar cotação via código me
    Preencher campo    ${header}[input_busca]    ${numero_cotacao}
    Clicar elemento    ${header}[btn_busca]
    Clicar link        ${numero_cotacao}

Validar resposta de cotação
    [Arguments]    ${dados_fornecedor}

    # Validar fornecedor no grid de respostas de cotação
    Validar texto contendo    ${modal_show_cotacao}[tbl_resposta_cotacao]    ${dados_fornecedor}[nome]

Visualizar resposta de cotação no novo mapa comparativo
    [Arguments]    ${dados_fornecedor}

    # Acessar mapa comparativo
    Clicar elemento              ${modal_show_cotacao}[btn_novo_mapa_comparativo]
    Trocar aba ativa
    Aguardar elemento visível    ${comparative_panel}[tbl_mapa_comparativo]

    # Validar fornecedor no mapa comparativo
    Validar texto contendo    ${comparative_panel}[tbl_mapa_comparativo]    ${dados_fornecedor}[nome]

Visualizar resposta de cotação mapa comparativo default
    [Arguments]    ${dados_fornecedor}

    # Acessar mapa comparativo
    Clicar elemento              ${modal_show_cotacao}[btn_mapa_comparativo_default]
    Aguardar elemento visível    ${modal_mapa_comparativo_default}[tbl_mapa_comparativo]

    # Validar fornecedor no mapa comparativo
    Validar texto contendo    ${modal_mapa_comparativo_default}[tbl_mapa_comparativo]    ${dados_fornecedor}[nome]    

Ocultar resposta de cotação
    [Arguments]    ${dados_fornecedor}

    # Ocultando resposta de cotação pública do mapa comparativo
    Clicar elemento              ${modal_show_cotacao}[btn_ocultar_forn]${dados_fornecedor}[id]
    Aguardar elemento visível    ${modal_show_cotacao}[btn_exibir_forn]${dados_fornecedor}[id]

Validar resposta de cotação oculta no novo mapa comparativo
    [Arguments]    ${dados_fornecedor}

    # Acessar mapa comparativo
    Clicar elemento              ${modal_show_cotacao}[btn_novo_mapa_comparativo]
    Trocar aba ativa
    Aguardar elemento visível    ${comparative_panel}[tbl_mapa_comparativo]

    # Validar fornecedor oculto no mapa comparativo
    Validar texto não contendo    ${comparative_panel}[tbl_mapa_comparativo]    ${dados_fornecedor}[nome]

Validar resposta de cotação oculta mapa comparativo default
    [Arguments]    ${dados_fornecedor}

    # Acessar mapa comparativo
    Clicar elemento              ${modal_show_cotacao}[btn_mapa_comparativo_default]
    Aguardar elemento visível    ${modal_mapa_comparativo_default}[tbl_mapa_comparativo]

    # Validar fornecedor oculto no mapa comparativo
    Validar texto não contendo    ${modal_mapa_comparativo_default}[tbl_mapa_comparativo]    ${dados_fornecedor}[nome]


