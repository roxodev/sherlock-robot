*Settings
Documentation    Get segment by filter

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token MeWeb

*Test Cases
Success
    [Tags]    api
    ...       segment_api
    ...       get_by_filter
    ...       get_by_filter_success

    # Instanciando massa de dados
    ${get_segment_by_filter}    Factory Segment API    get_by_filter

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Buscando segmentos via nome
    GET API    ${segment_api}?filter=${get_segment_by_filter}[success][name]
    ...        ${headers}
    ...        200

    # Criando dicionário para validação
    ${segment}    Set Variable    ${response.json()}[0]    

    # Removendo chaves desnecessárias
    Remove from dictionary    ${segment}
    ...                       allParentIds
    ...                       hasChild

    # Validando response
    Should be equal as strings    ${segment}    ${get_segment_by_filter}[success]

Unauthorized
    [Tags]    api
    ...       segment_api
    ...       get_by_filter
    ...       get_by_filter_unauthorized

    # Instanciando massa de dados
    ${get_segment_by_filter}    Factory Segment API    get_by_filter
    ${events}                   Factory Segment API    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Buscando segmentos via nome
    GET API    ${segment_api}?filter=${get_segment_by_filter}[unauthorized][filter]
    ...        ${empty}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]