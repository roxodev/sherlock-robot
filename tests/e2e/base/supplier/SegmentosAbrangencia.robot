*Settings
Documentation    Métodos de Segmentos

*Keywords
Acessar página de segmentos
    Clicar elemento                ${card_perfil}[btn_abrir_card_perfil]
    Clicar link                    Perfil
    Clicar link                    Segmentos

Adicionar segmentos
    [Arguments]    ${segmentos}

    # Acessando componente de cadastro de segmentos
    Clicar botão    Adicionar Segmento

    # Criando lista de segmentos
    @{segmentos}    Set Variable    ${segmentos}

    # Adicionando lista de segmentos
    FOR    ${segmento}    IN    @{segmentos}

    Preencher campo              ${supplier_segments_add}[input_busca_segmentos]    ${segmento}
    Aguardar elemento visível    ${supplier_segments_add}[campo_resultado_busca]    
    Clicar elemento via js       ${supplier_segments_add}[input_check_segmento] 

    END

    Clicar botão    Salvar

Adicionar abrangência
    [Arguments]    ${abrangencia}

    # Adicionando abrangência
    Clicar elemento    ${supplier_segments}[input_abrangencia]
    Clicar elemento    ${supplier_segments}[lista_opcao_abrangencia] >> text=${abrangencia}[abrangencia]

Validar segmentos
    [Arguments]    ${segmentos}

    # Adicionando lista de segmentos
    @{segmentos}    Set Variable    ${segmentos}

    # Validando lista de segmentos
    FOR    ${segmento}    IN    @{segmentos}

    Validar texto contendo    ${supplier_segments}[lista_segmentos]    ${segmento}

    END

Validar abrangencia
    [Arguments]    ${abrangencia}

    # Validando abrangência
    Validar texto contendo    ${supplier_segments}[campo_abrangencia]    ${abrangencia}[abrangencia]

Excluir segmento
    [Arguments]    ${msg_modal}

    Clicar elemento           ${supplier_segments}[btn_excluir_segmento]
    Validar texto contendo    ${supplier_segments}[modal_excluir_segmento]    ${msg_modal}[msg_confirma_excluir_segmento]
    Clicar botão              Sim

Excluir todos os segmentos
    [Arguments]    ${msg_modal}

    # Excluindo todos os segmentos
    FOR    ${seg}    IN RANGE    1    999999

    Clicar elemento    ${supplier_segments}[btn_excluir_segmento]

    ${condicao}=    Run Keyword And Return Status
    ...             Get Text                         ${supplier_segments}[modal_excluir_segmento]    contains    ${msg_modal}[msg_alerta_excluir_segmento]

    Exit For Loop If          ${condicao} == True
    Validar texto contendo    ${supplier_segments}[modal_excluir_segmento]    ${msg_modal}[msg_confirma_excluir_segmento]
    Clicar botão              Sim

    END

    # Validando mensagem de alerta para exlusão de todos os segmentos
    Validar texto contendo    ${supplier_segments}[modal_excluir_segmento]    ${msg_modal}[msg_alerta_excluir_segmento]
    Capturar evidência
    Clicar botão              OK