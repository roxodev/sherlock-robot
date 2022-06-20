*Settings
Documentation    Vincular Acessos

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão               ${base_url_keycloak}
Test Teardown    Capturar evidência

*Test Cases
Vincular um acesso
    [Tags]    # e2e
    ...       meus_acessos
    ...       vincular_acessos
    ...       vincular_um_acesso

Vincular múltiplos acessos
    [Tags]    # e2e
    ...       meus_acessos
    ...       vincular_acessos
    ...       vincular_multiplos_acessos