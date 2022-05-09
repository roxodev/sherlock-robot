*Settings
Documentation    Get segment by id

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token MeWeb

*Test Cases
Success
    [Tags]    api
    ...       segment_api
    ...       get_segment_by_id
    ...       get_segment_by_id_success

    # Instanciando massa de dados
    ${get_by_id}    Factory Segment API    get_by_id

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultar segmento via id
    GET API    ${segment_api}/${get_by_id}[success][id]
    ...        ${headers}
    ...        200

    # Criando dicionário para validação
    ${segment}    Set Variable    ${response.json()}    

    # Removendo chaves desnecessárias
    Remove from dictionary    ${segment}
    ...                       children      

    # Validando response
    Should be equal as strings    ${segment}    ${get_by_id}[success]

No Content
    [Tags]    api
    ...       segment_api
    ...       get_segment_by_id
    ...       get_by_id_no_content

    # Instanciando massa de dados
    ${get_by_id}    Factory Segment API    get_by_id
    ${events}       Factory Segment API    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultar segmento via id
    GET API    ${segment_api}/${get_by_id}[no_content][id]
    ...        ${headers}
    ...        204

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[no_content]

Unauthorized
    [Tags]    api
    ...       segment_api
    ...       get_by_id
    ...       get_by_id_unauthorized

    # Instanciando massa de dados
    ${get_by_id}    Factory Segment API    get_by_id
    ${events}       Factory Segment API    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultar segmento via id
    GET API    ${segment_api}/${get_by_id}[unauthorized][id]
    ...        ${empty}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]