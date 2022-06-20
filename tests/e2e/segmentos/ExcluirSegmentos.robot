*Settings
Documentation    Excluir segmentos

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup e teardown
Suite Setup      Configurar ambiente
Test Setup       Iniciar sessão               ${base_url_meweb}
Test Teardown    Capturar evidência

*Test Cases
Excluir um segmento
    [Tags]    e2e
    ...       segmentos
    ...       excluir_segmentos
    ...       excluir_um_segmento

    # Instanciando massa de dados
    ${excluir_um_segmento}    Factory Excluir Segmentos    excluir_um_segmento

    Login MEWeb                    ${excluir_um_segmento}[login]
    Acessar página de segmentos
    Adicionar segmento             ${excluir_um_segmento}[segmento]
    Excluir segmento               
    Validar texto não contendo     ${supplier_segments}[lista_segmentos]    ${excluir_um_segmento}[segmento]

Excluir todos os segmentos
    [Tags]    e2e
    ...       segmentos
    ...       excluir_segmentos
    ...       excluir_todos_segmentos

    # Instanciando massa de dados
    ${excluir_todos_segmentos}    Factory Excluir Segmentos    excluir_todos_segmentos

    Login MEWeb                    ${excluir_todos_segmentos}[login]
    Acessar página de segmentos
    Excluir segmento
    Validar texto contendo         ${supplier_segments}[lista_segmentos]    ${excluir_todos_segmentos}[segmento] 