*Settings
Documentation    Search by segments with filter

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token MeWeb

*Test Cases
Success
    [Tags]    api
    ...       segment_api
    ...       search_with_filter
    ...       search_with_filter_success

    # Instanciando massa de dados
    ${search_with_filter}    Factory Segment API    search_with_filter

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=${search_with_filter}[filter]&pageNumber=${search_with_filter}[page_number]&pageSize=${search_with_filter}[page_size]
    ...        ${headers}
    ...        200

    # Criando dicionário para validação
    ${segment}    Set Variable    ${response.json()}[items][0]    

    # Removendo chaves desnecessárias
    Remove from dictionary    ${segment}
    ...                       allParentIds
    ...                       hasChild

    # Validando response
    Should be equal as strings    ${segment}    ${search_with_filter}[success][response]

Bad request
    [Tags]    api
    ...       segment_api
    ...       search_with_filter
    ...       search_with_filter_bad_request

    [Template]     Bad request
    filter
    page_size
    page_number

Unauthorized
    [Tags]    api
    ...       segment_api
    ...       search_with_filter
    ...       search_with_filter_unauthorized

    # Instanciando massa de dados
    ${search_with_filter}    Factory Segment API    search_with_filter
    ${events}                Factory Segment API    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=${search_with_filter}[filter]&pageNumber=${search_with_filter}[page_number]&pageSize=${search_with_filter}[page_size]
    ...        ${empty}
    ...        401

    # Validando response
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${search_with_filter}    Factory Segment API    search_with_filter
    ${events}                Factory Segment API    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    IF    '${chave}' == 'filter'

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=${search_with_filter}[bad_request][filter]&pageNumber=${search_with_filter}[page_number]&pageSize=${search_with_filter}[page_size]
    ...        ${headers}
    ...        400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][filter]    ${events}[${chave}]

    ELSE IF    '${chave}' == 'page_number'

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=${search_with_filter}[bad_request][filter]&pageNumber=${search_with_filter}[bad_request][page_number]&pageSize=${search_with_filter}[page_size]
    ...        ${headers}
    ...        400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][pageNumber]    ${events}[${chave}]

    ELSE

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=${search_with_filter}[filter]&pageNumber=${search_with_filter}[page_number]&pageSize=${search_with_filter}[bad_request][page_size]
    ...        ${headers}
    ...        400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][pageSize]    ${events}[${chave}]

    END



