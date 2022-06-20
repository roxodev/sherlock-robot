*Settings
Documentation    Desvincular Acessos

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão               ${base_url_keycloak}
Test Teardown    Capturar evidência

*Test Cases
Desvincular um acesso
    [Tags]    # e2e
    ...       meus_acessos
    ...       desvincular_acessos
    ...       desvincular_um_acesso

    # Instanciando massa de dados
    ${desvincular_um_acesso}    Factory Desvincular Acessos    desvincular_um_acesso

    Login Keycloak        ${desvincular_um_acesso}[login]

Desvincular múltiplos acessos
    [Tags]    # e2e
    ...       meus_acessos
    ...       desvincular_acessos
    ...       desvincular_multiplos_acessos

Desvincular acesso corrente
    [Tags]    # e2e
    ...       meus_acessos
    ...       desvincular_acessos
    ...       desvincular_acesso_corrente

    Login Keycloak    dados_login