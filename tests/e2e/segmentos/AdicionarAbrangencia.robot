*Settings
Documentation    Adicionar abrangência

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente Meweb
Test Setup       Iniciar sessão MeWeb
Test Teardown    Capturar evidência

*Test Cases
Atualizar abrangência
    [Tags]    e2e
    ...       segmentos
    ...       adicionar_abrangencia
    ...       atualizar_abrangencia

    # Instanciando massa de dados
    ${atualizar_abrangencia}    Factory Adicionar Abrangencia    atualizar_abrangencia

    Login MEWeb                    ${atualizar_abrangencia}[login]
    Acessar página de segmentos
    Adicionar abrangência          ${atualizar_abrangencia}[abrangencia]
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Acessar página de segmentos
    Validar texto igual            ${supplier_segments}[campo_abrangencia]    
    ...                            ${atualizar_abrangencia}[abrangencia]

Submeter sem adicionar abrangência
    [Tags]    e2e
    ...       segmentos
    ...       adicionar_abrangencia
    ...       submeter_sem_abrangencia

    # Instanciando massa de dados
    ${submeter_sem_abrangencia}    Factory Adicionar Abrangencia    submeter_sem_abrangencia

    Login MEWeb                    ${submeter_sem_abrangencia}[login]
    Acessar página de segmentos
    Clicar elemento                ${supplier_segments}[btn_excluir_abrangencia]
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Validar texto contendo         ${supplier_segments}[campo_alerta_segmento_abrangencia]
    ...                            ${submeter_sem_abrangencia}[alerta_abrangencia]
