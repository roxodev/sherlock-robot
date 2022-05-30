*Settings
Documentation    Adicionar segmentos

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente MeWeb
Test Setup       Iniciar sessão MeWeb
Test Teardown    Capturar evidência

*Test Cases
Adicionar segmento pai já cadastrado
    [Tags]    e2e
    ...       segmentos
    ...       adicionar_segmentos
    ...       segmento_pai_cadastrado

    # Intanciando massa de dados
    ${segmento_pai_cadastrado}    Factory Adicionar Segmentos    segmento_pai_cadastrado

    Login MEWeb                    ${segmento_pai_cadastrado}[login]
    Acessar página de segmentos
    Adicionar segmento             ${segmento_pai_cadastrado}[segmento]
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Acessar página de segmentos
    Validar texto contendo         ${supplier_segments}[lista_segmentos]    
    ...                            ${segmento_pai_cadastrado}[segmento]

Adicionar segmento pai não cadastrado
    [Tags]    e2e
    ...       segmentos
    ...       adicionar_segmentos
    ...       segmento_pai_nao_cadastrado

    # Intanciando massa de dados
    ${segmento_pai_nao_cadastrado}    Factory Adicionar Segmentos    segmento_pai_nao_cadastrado

    Login MEWeb                    ${segmento_pai_nao_cadastrado}[login]
    Acessar página de segmentos
    Adicionar segmento             ${segmento_pai_nao_cadastrado}[segmento]
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Acessar página de segmentos
    Validar texto contendo         ${supplier_segments}[lista_segmentos]       
    ...                            ${segmento_pai_nao_cadastrado}[segmento]

Adicionar segmento filho de um segmento pai já cadastrado
    [Tags]    e2e
    ...       segmentos
    ...       adicionar_segmentos
    ...       segmento_filho_pai_cadastrado

    # Intanciando massa de dados
    ${segmento_filho_pai_cadastrado}    Factory Adicionar Segmentos    segmento_filho_pai_cadastrado

    Login MEWeb                    ${segmento_filho_pai_cadastrado}[login]
    Acessar página de segmentos
    Adicionar segmento             ${segmento_filho_pai_cadastrado}[segmento]
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Acessar página de segmentos
    Validar texto contendo         ${supplier_segments}[lista_segmentos]         
    ...                            ${segmento_filho_pai_cadastrado}[segmento]

Adicionar segmento filho de um segmento pai não cadastrado
    [Tags]    e2e
    ...       segmentos
    ...       adicionar_segmentos
    ...       segmento_filho_pai_nao_cadastrado

    # Intanciando massa de dados
    ${segmento_filho_pai_nao_cadastrado}    Factory Adicionar Segmentos    segmento_filho_pai_nao_cadastrado

    Login MEWeb                    ${segmento_filho_pai_nao_cadastrado}[login]
    Acessar página de segmentos
    Adicionar segmento             ${segmento_filho_pai_nao_cadastrado}[segmento_filho]
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Acessar página de segmentos
    Validar texto contendo         ${supplier_segments}[lista_segmentos]                   
    ...                            ${segmento_filho_pai_nao_cadastrado}[segmento_pai]
    Validar texto contendo         ${supplier_segments}[lista_segmentos]                   
    ...                            ${segmento_filho_pai_nao_cadastrado}[segmento_filho]

Submeter sem adicionar segmentos
    [Tags]    e2e
    ...       segmentos
    ...       adicionar_segmentos
    ...       submeter_sem_segmentos

    # Intanciando massa de dados
    ${submeter_sem_segmentos}    Factory Adicionar Segmentos    submeter_sem_segmentos

    Login MEWeb                    ${submeter_sem_segmentos}[login]
    Acessar página de segmentos
    Clicar elemento                ${comum}[btn_salvar_avancar]
    Validar texto contendo         ${supplier_segments}[campo_alerta_segmento_abrangencia]
    ...                            ${submeter_sem_segmentos}[alerta_segmento]

