*Settings
Documentation    Alterar Usuário Corrente

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente Meweb
Test Setup       Iniciar sessão Keycloak
Test Teardown    Capturar evidência

*Test Cases
Alterar usuário corrente