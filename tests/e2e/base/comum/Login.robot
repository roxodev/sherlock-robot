*Settings
Documentation    Login MEWeb

*Keywords
# Realiza login de usuários
Login MEWeb
    [Arguments]    ${dados_login}

    # Acessando página de login
    Go To          ${base_url}
    Validar url    ${default_asp}[url]

    # Preenchendo credenciais
    Preencher campo    ${default_asp}[input_login]    ${dados_login}[usuario]
    Preencher campo    ${default_asp}[input_senha]    ${senha}[senha]

    # Submetendo credenciais
    Clicar elemento    ${default_asp}[btn_login]

    # Alterando senha de acesso expirada
    ${condicao}=    Run Keyword And Return Status
    ...             Aguardar elemento visível        ${comum}[campo_titulo] >> text=Alterar Senha

    IF    ${condicao} == True

    Preencher campo    ${muda_senha_asp}[input_senha_antiga]           ${senha}[senha]
    Preencher campo    ${muda_senha_asp}[input_senha_nova]             ${senha}[senha_nova]
    Preencher campo    ${muda_senha_asp}[input_confirma_senha_nova]    ${senha}[senha_nova]
    Clicar link        Alterar

    END

    # Definindo timezone
    ${condicao}=    Run Keyword And Return Status
    ...             Aguardar elemento visível        ${timezone_mvc}[modal_timezone]


    IF    ${condicao} == True

    Clicar elemento    ${timezone_mvc}[btn_aceitar]

    END

    # Habilitando nova home
    ${condicao}=    Run Keyword And Return Status
    ...             Aguardar elemento visível        ${mercado_compras}[banner_experiencia]

    IF    ${condicao} == True

    Clicar elemento via js    ${mercado_compras}[btn_habilita_nova_home]

    END

    # Fechando billing modal
    ${condicao}=    Run Keyword And Return Status
    ...             Aguardar elemento visível        ${supplier_inbox}[modal_billing]

    IF    ${condicao} == True

    Clicar botão    Ver Depois
    Clicar botão    Ok, entendi

    END

    # Fechando modal novidades segmentos
    ${condicao}=    Run Keyword And Return Status
    ...             Aguardar elemento visível        ${supplier_inbox}[modal_novidades_segmentos]

    IF    ${condicao} == True

    Clicar elemento via js    ${modal_novidades_segmentos}[check_nao_mostar_novamente]
    Clicar botão              Ver depois

    END

    # Validando login
    Clicar elemento        ${card_perfil}[btn_abrir_card_perfil]
    Validar texto igual    ${card_perfil}[campo_nome_usuario]        ${dados_login}[nome]
    Clicar elemento        ${card_perfil}[btn_fechar_card_perfil]

# Realiza logoff de usuários
Logoff MEWeb
    Go To              ${base_url}
    Clicar elemento    ${card_perfil}[btn_abrir_card_perfil]
    Clicar link        Logoff
