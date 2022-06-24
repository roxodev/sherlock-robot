*Settings
Documentation    Desvincular Acessos

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão         ${base_url_keycloak}
Test Teardown    Capturar evidência

*Test Cases
Desvincular um acesso
    [Tags]    e2e
    ...       meus_acessos
    ...       desvincular_acessos
    ...       desvincular_um_acesso

    # Instanciando massa de dados
    ${desvincular_um_acesso}    Factory Desvincular Acessos    desvincular_um_acesso

    Configurar acessos Keycloak
    Login Keycloak                    ${desvincular_um_acesso}[login]
    Acessar página de meus acessos
    Selecionar acesso                 ${desvincular_um_acesso}[acesso][id]
    Clicar botão                      Desvincular Selecionados
    Validar texto igual               ${supplier_user}[toaster_acessos]              
    ...                               Acessos desvinculados com sucesso
    Validar texto não contendo        ${supplier_user}[tbl_acessos_vinculados]       
    ...                               ${desvincular_um_acesso}[acesso][login]
    Clicar link                       Acessos a Vincular
    Validar texto contendo            ${supplier_user}[tbl_acessos_desvinculados]    
    ...                               ${desvincular_um_acesso}[acesso][login]        

Desvincular múltiplos acessos
    [Tags]    e2e
    ...       meus_acessos
    ...       desvincular_acessos
    ...       desvincular_multiplos_acessos

    # Instanciando massa de dados
    ${desvincular_multiplos_acessos}    Factory Desvincular Acessos    desvincular_multiplos_acessos

    Configurar acessos Keycloak
    Login Keycloak                    ${desvincular_multiplos_acessos}[login]
    Acessar página de meus acessos

    FOR    ${id}    IN    @{desvincular_multiplos_acessos}[acessos][ids]

    Selecionar acesso    ${id}

    END

    Clicar botão           Desvincular Selecionados
    Validar texto igual    ${supplier_user}[toaster_acessos]    
    ...                    Acessos desvinculados com sucesso

    FOR    ${login}    IN    @{desvincular_multiplos_acessos}[acessos][logins]

    Clicar link                   Acessos Vinculados
    Validar texto não contendo    ${supplier_user}[tbl_acessos_vinculados]       
    ...                           ${login}
    Clicar link                   Acessos a Vincular
    Validar texto contendo        ${supplier_user}[tbl_acessos_desvinculados]    
    ...                           ${login} 

    END

Desvincular acesso corrente
    [Tags]    e2e
    ...       meus_acessos
    ...       desvincular_acessos
    ...       desvincular_acesso_corrente

    # Instanciando massa de dados
    ${desvincular_acesso_corrente}    Factory Desvincular Acessos    desvincular_acesso_corrente

    Configurar acessos Keycloak
    Login Keycloak                    ${desvincular_acesso_corrente}[login]
    Acessar página de meus acessos
    Selecionar acesso                 ${desvincular_acesso_corrente}[acesso][id]
    Clicar botão                      Desvincular Selecionados
    Validar texto igual               ${supplier_user}[toaster_acessos]                  
    ...                               Erro ao salvar dados, por favor tente novamente
    Validar texto contendo            ${supplier_user}[tbl_acessos_vinculados]           
    ...                               ${desvincular_acesso_corrente}[acesso][login]