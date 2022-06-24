*Settings
Documentation    Login MEWeb

*Keywords
# Realiza login de usuários
Login MEWeb
    [Arguments]    ${dados_login}

    # Acessando página de login
    Go To    ${base_url_meweb}

    # Preenchendo credenciais
    Preencher campo    ${default_asp}[input_login]    ${dados_login}[usuario]
    Preencher campo    ${default_asp}[input_senha]    ${senha_meweb}[senha]

    # Submetendo credenciais
    Clicar elemento    ${default_asp}[btn_login]

    # Alterando senha de acesso expirada
    ${condicao}=    Run Keyword And Return Status
    ...             Aguardar elemento visível        ${comum}[campo_titulo] >> text=Alterar Senha

    IF    ${condicao} == True

    Preencher campo    ${muda_senha_asp}[input_senha_antiga]           ${senha_meweb}[senha]
    Preencher campo    ${muda_senha_asp}[input_senha_nova]             ${senha_meweb}[senha_nova]
    Preencher campo    ${muda_senha_asp}[input_confirma_senha_nova]    ${senha_meweb}[senha_nova]
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
    Validar texto igual    ${card_perfil}[campo_nome_usuario]       ${dados_login}[nome]

    # Validando idioma
    ${condicao}=    Run Keyword And Return Status
    ...             Get Text                         
    ...             ${header}[card_perfil]           contains    Português BR

    IF    ${condicao} == False

    Clicar elemento    ${card_perfil}[link_lista_idiomas]
    Clicar elemento    ${card_perfil}[link_pt_br]

    ELSE

    Clicar elemento    ${card_perfil}[btn_fechar_card_perfil]

    END

Login Keycloak
    [Arguments]    ${dados_login}

    # Acessando página de login
    Go To    ${base_url_keycloak}

    # Preenchendo credenciais
    Preencher campo    ${supplier_sso_auth}[input_email]    ${dados_login}[usuario]
    Preencher campo    ${supplier_sso_auth}[input_senha]    ${dados_login}[senha]

    # Submetendo credenciais
    Clicar elemento    ${supplier_sso_auth}[btn_login]

    # Associando acessos via primeiro acesso
    ${condicao}=    Run Keyword And Return Status
    ...             Aguardar elemento visível        ${supplier_user_first_access}[campo_titulo_controle_de_acesso]

    IF    ${condicao} == True

    Clicar botão    Iniciar

    # Associando acessos via primeiro acesso
    ${condicao}=    Run Keyword And Return Status
    ...             Aguardar elemento visível        ${supplier_user_first_access_relation}[campo_alerta_sem_acessos]

    IF    ${condicao} == False

    Aguardar elemento visível    ${supplier_user_first_access_relation}[input_seleciona_todos_acessos]
    Clicar elemento via js       input[class=custom-control-input][value=true]
    Capturar evidência
    Clicar botão                 Avançar

    ELSE

    Validar texto igual    ${supplier_user_first_access_relation}[campo_alerta_sem_acessos]                                                                                                    
    ...                    Você não possui acessos do Mercado Eletrônico com o e-mail do cadastro realizado. Fale conosco pelo e-mail marketplace@me.com.br e teremos o prazer de ajudá-lo!
    Capturar evidência
    Clicar elemento        ${supplier_user_first_access_relation}[link_sair]
    Pass Execution         Usuário Keycloak sem acessos ME Web relacionados

    END

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
    Validar texto igual    ${card_perfil}[campo_nome_usuario]       ${dados_login}[nome]

    # Validando idioma
    ${condicao}=    Run Keyword And Return Status
    ...             Get Text                         
    ...             ${header}[card_perfil]           contains    Português BR

    IF    ${condicao} == False

    Clicar elemento    ${card_perfil}[link_lista_idiomas]
    Clicar elemento    ${card_perfil}[link_pt_br]

    ELSE

    Clicar elemento    ${card_perfil}[btn_fechar_card_perfil]

    END

# Realiza logoff de usuários
Logoff MEWeb
    Go To              ${base_url_meweb}
    Clicar elemento    ${card_perfil}[btn_abrir_card_perfil]
    Clicar link        Logoff
