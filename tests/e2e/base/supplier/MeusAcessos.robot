*Settings
Documentation    Métodos de Segmentos

*Keywords
Acessar página de meus acessos
    Clicar elemento              ${card_perfil}[btn_abrir_card_perfil]
    Clicar elemento              ${card_perfil}[btn_meus_acessos]
    Aguardar elemento visível    ${supplier_user}[campo_titulo]

Selecionar acesso
    [Arguments]    ${id}

    Aguardar elemento visível    css=input[value="${id}"]
    Clicar elemento via js       input[value="${id}"]

Alterar acesso corrente
    [Arguments]    ${nome_novo_acesso}

    Clicar elemento        ${card_perfil}[btn_abrir_card_perfil]
    Clicar elemento        ${card_perfil}[btn_lista_alterar_acesso]
    Clicar elemento        ${card_perfil}[btn_alterar_acesso]
    Clicar elemento        ${card_perfil}[btn_abrir_card_perfil]
    Validar texto igual    ${card_perfil}[campo_nome_usuario]          ${nome_novo_acesso}[nome]

