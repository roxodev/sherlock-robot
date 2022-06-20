*Settings
Documentation    Alterar Usuário

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão               ${base_url_keycloak}
Test Teardown    Capturar evidência

*Test Cases
Alterar usuário corrente
    [Tags]    # e2e
    ...       meus_acessos
    ...       alterar_usuario
    ...       alterar_usuario_corrente