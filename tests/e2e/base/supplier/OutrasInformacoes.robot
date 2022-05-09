*Settings
Documentation    Métodos de Outras Informações

*Keywords
Acessar página de outras informações
    Clicar elemento              ${card_perfil}[btn_abrir_card_perfil]
    Clicar link                  Perfil
    Clicar link                  Outras Informações

Adicionar porte
    [Arguments]    ${porte}

    # Adicionando porte
    Clicar elemento    ${supplier_info}[input_porte]
    Clicar elemento    ${supplier_info}[lista_opcao_porte] >> text=${porte}[porte]

Validar porte
    [Arguments]    ${porte}

    # Validando porte
    Validar texto contendo    ${supplier_info}[campo_porte]    ${porte}[porte]

