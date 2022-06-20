
*Settings
Documentation    Cadastro de segmentos e abrangência no primeiro acesso

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão               ${base_url_meweb}
Test Teardown    Capturar evidência

*Test Cases
Adicionar segmentos e abrangência no primeiro acesso
    [Tags]    e2e
    ...       segmentos
    ...       primeiro_acesso
    ...       segmentos_abrangencia_primeiro_acesso

    # Intanciando massa de dados
    ${primeiro_acesso}    Factory Primeiro Acesso    primeiro_acesso

    Login MEWeb                  ${primeiro_acesso}[login]
    Adicionar segmento           ${primeiro_acesso}[segmento]
    Adicionar abrangência        ${primeiro_acesso}[abrangencia]
    Clicar elemento              ${comum}[btn_salvar_avancar]
    Aguardar elemento visível    ${supplier_inbox}[modal_novidades_segmentos]

Submeter sem adicionar segmentos no primeiro acesso
    [Tags]    e2e
    ...       segmentos
    ...       primeiro_acesso
    ...       submeter_sem_segmentos_primeiro_acesso

    # Intanciando massa de dados
    ${submeter_sem_segmentos}    Factory Primeiro Acesso    submeter_sem_segmentos

    Login MEWeb                    ${submeter_sem_segmentos}[login]
    Acessar página de segmentos
    Adicionar abrangência          ${submeter_sem_segmentos}[abrangencia]
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Validar texto contendo         ${supplier_segments}[campo_alerta_segmento_abrangencia]
    ...                            ${submeter_sem_segmentos}[alerta_segmento]

Submeter sem adicionar abrangência no primeiro acesso
    [Tags]    e2e
    ...       segmentos
    ...       primeiro_acesso
    ...       submeter_sem_abrangencia_primeiro_acesso

    # Instanciando massa de dados
    ${submeter_sem_abrangencia}    Factory Primeiro Acesso    submeter_sem_abrangencia

    Login MEWeb                    ${submeter_sem_abrangencia}[login]
    Acessar página de segmentos
    Adicionar segmento             ${submeter_sem_abrangencia}[segmento]
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Validar texto contendo         ${supplier_segments}[campo_alerta_segmento_abrangencia]
    ...                            ${submeter_sem_abrangencia}[alerta_abrangencia]