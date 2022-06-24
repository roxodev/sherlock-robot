*Settings
Documentation    Primeiro Acesso Keycloak

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão         ${base_url_keycloak}
Test Teardown    Capturar evidência

*Test Cases
Primeiro acesso via Keycloak com acessos ME Web relacionados
    [Tags]    e2e
    ...       meus_acessos
    ...       primeiro_acesso_keycloak
    ...       acessos_meweb_relacionados

    # Instanciando massa de dados
    ${acessos_meweb_relacionados}    Factory Primeiro Acesso Keycloak    acessos_meweb_relacionados

    Excluir usuário Keycloak
    Login Keycloak              ${acessos_meweb_relacionados}[login]

Primeiro acesso via Keycloak sem acessos ME Web relacionados
    [Tags]    e2e
    ...       meus_acessos
    ...       primeiro_acesso_keycloak
    ...       acessos_meweb_nao_relacionados

    # Instanciando massa de dados
    ${acessos_meweb_nao_relacionados}    Factory Primeiro Acesso Keycloak    acessos_meweb_nao_relacionados

    Login Keycloak    ${acessos_meweb_nao_relacionados}[login]

