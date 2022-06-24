*Settings
Documentation    Vincular Acessos

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão         ${base_url_keycloak}
Test Teardown    Capturar evidência

*Test Cases
Vincular um acesso
    [Tags]    e2e
    ...       meus_acessos
    ...       vincular_acessos
    ...       vincular_um_acesso

    # Instanciando massa de dados
    ${vincular_um_acesso}    Factory Vincular Acessos    vincular_um_acesso

    Configurar acessos Keycloak
    Login Keycloak                    ${vincular_um_acesso}[login]
    Acessar página de meus acessos
    Clicar link                       Acessos a Vincular
    Selecionar acesso                 ${vincular_um_acesso}[acesso][id]
    Clicar botão                      Vincular Selecionados
    Validar texto igual               ${supplier_user}[toaster_acessos]              
    ...                               Acessos vinculados com sucesso
    Validar texto não contendo        ${supplier_user}[tbl_acessos_desvinculados]    
    ...                               ${vincular_um_acesso}[acesso][login]
    Clicar link                       Acessos Vinculados
    Validar texto contendo            ${supplier_user}[tbl_acessos_vinculados]       
    ...                               ${vincular_um_acesso}[acesso][login]

Vincular múltiplos acessos
    [Tags]    e2e
    ...       meus_acessos
    ...       vincular_acessos
    ...       vincular_multiplos_acessos

        # Instanciando massa de dados
    ${vincular_multiplos_acessos}    Factory Vincular Acessos    vincular_multiplos_acessos

    Configurar acessos Keycloak
    Login Keycloak                    ${vincular_multiplos_acessos}[login]
    Acessar página de meus acessos
    Clicar link                       Acessos a Vincular

    FOR    ${id}    IN    @{vincular_multiplos_acessos}[acessos][ids]

    Selecionar acesso    ${id}

    END

    Clicar botão           Vincular Selecionados
    Validar texto igual    ${supplier_user}[toaster_acessos]    
    ...                    Acessos vinculados com sucesso

    FOR    ${login}    IN    @{vincular_multiplos_acessos}[acessos][logins]

    Clicar link                   Acessos a Vincular
    Validar texto não contendo    ${supplier_user}[tbl_acessos_desvinculados]    
    ...                           ${login}
    Clicar link                   Acessos Vinculados
    Validar texto contendo        ${supplier_user}[tbl_acessos_vinculados]
    ...                           ${login}

    END