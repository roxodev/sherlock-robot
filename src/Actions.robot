*Settings
Documentation    Ações Gerais

*Keywords
# Aguardar elemento visível
Aguardar elemento visível
    [Arguments]    ${elemento}

    Wait For Elements State    ${elemento}    visible    15

# Clicar elemento
Clicar elemento
    [Arguments]    ${elemento}

    Aguardar elemento visível    ${elemento}
    Click                        ${elemento}

# Clicar botão
Clicar botão
    [Arguments]    ${texto_botao}

    ${botao}    Set Variable    css=button >> text=${texto_botao}

    Aguardar elemento visível    ${botao}
    Click                        ${botao}

# Clicar link
Clicar link
    [Arguments]    ${texto_link}

    ${link}    Set Variable    css=a >> text=${texto_link}

    Aguardar elemento visível    ${link}
    Click                        ${link}

# Clicar elemento via js radio button
Clicar elemento via js
    [Arguments]    ${elemento}

    Execute Javascript    document.querySelector('${elemento}').click()

Selecionar opção
    [Arguments]    ${elemento}    
    ...            ${opcao}

    Aguardar elemento visível    ${elemento}
    Select Options By            ${elemento}    text    ${opcao}

# Seleciona opção se campo existe na página
Selecionar opção se existente
    [Arguments]    ${elemento}    
    ...            ${opcao}

    ${condicao}=    Run Keyword And Return Status
    ...             Wait For Elements State          ${elemento}    visible    1

    IF    ${condicao} == True

    Select Options By    ${elemento}    text    ${opcao}

    END

# Preencher campo de texto
Preencher campo
    [Arguments]    ${elemento}    
    ...            ${texto}

    Aguardar elemento visível    ${elemento}
    Fill Text                    ${elemento}    ${texto}

# Preenche campo se o mesmo existe na página
Preencher campo se existente
    [Arguments]    ${elemento}
    ...            ${texto}

    ${condicao}=    Run Keyword And Return Status
    ...             Wait For Elements State          ${elemento}    visible    1

    IF    ${condicao} == True

    Preencher campo    ${elemento}    ${texto}

    END

# Validar se texto do elemento é igual ao esperado
Validar texto igual
    [Arguments]    ${elemento}
    ...            ${texto}

    Aguardar elemento visível    ${elemento}
    Get Text                     ${elemento}    equal    ${texto}

# Validar se texto do elemento é igual ao esperado
Validar texto diferente
    [Arguments]    ${elemento}
    ...            ${texto}

    Aguardar elemento visível    ${elemento}
    Get Text                     ${elemento}    inequal    ${texto}

# Validar se texto do elemento contém o texto esperado
Validar texto contendo
    [Arguments]    ${elemento}    
    ...            ${texto}

    Aguardar elemento visível    ${elemento}
    Get Text                     ${elemento}    contains    ${texto}

# Validar se texto do elemento contém o texto esperado
Validar texto não contendo
    [Arguments]    ${elemento}    
    ...            ${texto}

    Aguardar elemento visível    ${elemento}
    Get Text                     ${elemento}    not contains    ${texto}

# Realiza Upload arquivos
Upload arquivo
    [Arguments]    ${elemento}
    ...            ${path_arquivo}

    Aguardar elemento visível    ${elemento}
    Upload File By Selector      ${elemento}    ${EXECDIR}${path_arquivo}

Trocar aba ativa
    ${pagina}=     Get Page Ids    ALL
    Switch Page    ${pagina}[0]

Fechar aba ativa
    ${pagina}=    Get Page Ids    ALL
    Close Page    ${pagina}[0]

Validar url
    [Arguments]    ${url}

    Get Url    contains    ${url}









