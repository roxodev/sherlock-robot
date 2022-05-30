*Settings
Documentation    Ordenar cotação pública

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente Meweb
Test Setup       Iniciar sessão MeWeb
Test Teardown    Capturar evidência

*Test Cases
Ordenar cotação pública por relevância

Ordenar cotação pública por data de criação

Ordenar cotação pública por data de vencimento