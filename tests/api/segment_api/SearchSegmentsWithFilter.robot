*Settings
Documentation    Search by segments with filter

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
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

Filter must have at least 3 characters
    [Tags]    api
    ...       segment_api
    ...       search_with_filter
    ...       search_with_filter_legth_invalid

    # Instanciando massa de dados
    ${bad_request}    Factory Segment API    bad_request

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=ac&pageNumber=1&pageSize=20
    ...        ${headers}
    ...        400

    # Convertendo resposse body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][filter]

Page size must be greater than 0
    [Tags]    api
    ...       segment_api
    ...       search_with_filter
    ...       search_with_filter_page_size_invalid

    # Instanciando massa de dados
    ${bad_request}    Factory Segment API    bad_request

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=Componentes e Suprimentos de Fabricação&pageNumber=1&pageSize=0
    ...        ${headers}
    ...        400

    # Convertendo resposse body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][pageSize]

Page number must be greater than 0
    [Tags]    api
    ...       segment_api
    ...       search_with_filter
    ...       search_with_filter_page_number_invalid

    # Instanciando massa de dados
    ${bad_request}    Factory Segment API    bad_request

    # Buscando segmentos
    GET API    ${segment_api}/search?filter=Componentes e Suprimentos de Fabricação&pageNumber=0&pageSize=20
    ...        ${headers}
    ...        400

    # Convertendo resposse body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][pageNumber]

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






