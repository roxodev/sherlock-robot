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
    ${success}    Factory Segment API    success

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=Componentes e Suprimentos de Fabricação&pageNumber=1&pageSize=10
    ...        ${headers}
    ...        200

    # Criando dicionário para validação
    ${segment}    Create dictionary
    ...           name=Componentes e Suprimentos de Fabricação
    ...           id=31000000

    # Validando response body
    Should be equal as strings    ${response.json()}[items][0][name]    ${segment}[name]
    Should be equal as strings    ${response.json()}[items][0][id]      ${segment}[id]

Bad request
    [Tags]    api
    ...       segment_api
    ...       search_with_filter
    ...       search_with_filter_bad_request

    [Template]    Bad request
    filter
    pageSize
    pageNumber

Unauthorized
    [Tags]    api
    ...       segment_api
    ...       search_with_filter
    ...       search_with_filter_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Segment API    unauthorized

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=Componentes e Suprimentos de Fabricação&pageNumber=1&pageSize=10
    ...        ${empty}
    ...        401

    # Validando response
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${bad_request}    Factory Segment API    bad_request

    # Definindo payload
    ${search_with_filter_payload}    Create dictionary
    ...                              filter=Componentes e Suprimentos de Fabricação
    ...                              pageNumber=1
    ...                              pageSize=10

    IF    '${chave}' == 'filter'

    Set to dictionary    ${search_with_filter_payload}
    ...                  ${chave}
    ...                  ac

    ELSE

    Set to dictionary    ${search_with_filter_payload}
    ...                  ${chave}
    ...                  0

    END

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=${search_with_filter_payload}[filter]&pageNumber=${search_with_filter_payload}[pageNumber]&pageSize=${search_with_filter_payload}[pageSize]
    ...        ${headers}
    ...        400

    # Convertendo resposse body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][${chave}]




