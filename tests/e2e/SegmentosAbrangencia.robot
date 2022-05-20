*Settings
Documentation    Segmentos e Abrangência

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente Meweb
Test Setup       Iniciar sessão MeWeb
Test Teardown    Capturar evidência

*Test Cases
Adicionar segmento e abrangência no primeiro acesso
    [Tags]    e2e
    ...       segmentos
    ...       primeiro_acesso

    # Intanciando massa de dados
    ${primeiro_acesso}    Factory Segmentos    primeiro_acesso

    Login MEWeb                  ${primeiro_acesso}
    Adicionar segmentos          ${primeiro_acesso}[segmentos]
    Adicionar abrangência        ${primeiro_acesso}
    Submeter informações
    Aguardar elemento visível    ${supplier_inbox}[modal_novidades_segmentos]

Adicionar segmento pai já existente
    [Tags]    e2e
    ...       segmentos
    ...       pai_existente

    # Intanciando massa de dados
    ${pai_existente}    Factory Segmentos    pai_existente

    Login MEWeb                    ${pai_existente}
    Acessar página de segmentos
    Validar segmentos              ${pai_existente}[segmentos]
    Adicionar segmentos            ${pai_existente}[segmentos]
    Submeter informações
    Acessar página de segmentos
    Validar segmentos              ${pai_existente}[segmentos]

Adicionar segmento pai não existente
    [Tags]    e2e
    ...       segmentos
    ...       pai_nao_existente

    # Intanciando massa de dados
    ${pai_nao_existente}    Factory Segmentos    pai_nao_existente

    Login MEWeb                    ${pai_nao_existente}
    Acessar página de segmentos
    Adicionar segmentos            ${pai_nao_existente}[segmentos]
    Submeter informações
    Acessar página de segmentos
    Validar segmentos              ${pai_nao_existente}[segmentos]

Adicionar segmento filho de um segmento pai já existente
    [Tags]    e2e
    ...       segmentos
    ...       filho_pai_existente

    # Intanciando massa de dados
    ${filho_pai_existente}    Factory Segmentos    filho_pai_existente

    Login MEWeb                    ${filho_pai_existente}
    Acessar página de segmentos
    Validar segmentos              ${filho_pai_existente}[segmentos_pai]
    Adicionar segmentos            ${filho_pai_existente}[segmentos_filho]
    Submeter informações
    Acessar página de segmentos
    Validar segmentos              ${filho_pai_existente}[segmentos_pai]
    Validar segmentos              ${filho_pai_existente}[segmentos_filho]

Adicionar segmento filho de um segmento pai não existente
    [Tags]    e2e
    ...       segmentos
    ...       filho_pai_nao_existente

    # Intanciando massa de dados
    ${filho_pai_nao_existente}    Factory Segmentos    filho_pai_nao_existente

    Login MEWeb                    ${filho_pai_nao_existente}
    Acessar página de segmentos
    Adicionar segmentos            ${filho_pai_nao_existente}[segmentos_filho]
    Submeter informações
    Acessar página de segmentos
    Validar segmentos              ${filho_pai_nao_existente}[segmentos_pai]
    Validar segmentos              ${filho_pai_nao_existente}[segmentos_filho]

Exluir segmento
    [Tags]    e2e
    ...       segmentos
    ...       excluir_segmento

    # Instanciando massa de dados
    ${excluir_segmentos}    Factory Segmentos    excluir_segmentos

    Login MEWeb                    ${excluir_segmentos}
    Acessar página de segmentos
    Excluir segmento               ${excluir_segmentos}

    ${segmentos}=    Get text    ${supplier_segments}[lista_segmentos]

    Acessar página de segmentos
    Validar texto contendo         ${supplier_segments}[lista_segmentos]    ${segmentos}


Excluir todos os segmentos
    [Tags]    e2e
    ...       segmentos
    ...       excluir_todos_segmentos

    # Instanciando massa de dados
    ${excluir_segmentos}    Factory Segmentos    excluir_segmentos

    Login MEWeb                    ${excluir_segmentos}
    Acessar página de segmentos
    Excluir todos os segmentos     ${excluir_segmentos}

    ${segmentos}=    Get text    ${supplier_segments}[lista_segmentos]

    Acessar página de segmentos
    Validar texto contendo         ${supplier_segments}[lista_segmentos]    ${segmentos}

Atualizar abrangência
    [Tags]    e2e
    ...       segmentos
    ...       alterar_abrangencia

    # Instanciando massa de dados
    ${atualizar_abrangencia}    Factory Segmentos    atualizar_abrangencia

    Login MEWeb                    ${atualizar_abrangencia}
    Acessar página de segmentos
    Adicionar abrangência          ${atualizar_abrangencia}
    Submeter informações
    Acessar página de segmentos
    Validar abrangencia            ${atualizar_abrangencia}

*Keywords
Submeter informações
    Clicar elemento    ${comum}[btn_salvar_avancar]




