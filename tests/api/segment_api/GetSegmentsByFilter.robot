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
    ...       get_segment_by_filter
    ...       get_segment_by_filter_success

    # Instanciando massa de dados
    ${success}    Factory Segment API    success

    # Buscando segmentos via nome
    GET API    ${segment_api}?filter=Componentes e Suprimentos de Fabricação
    ...        ${headers}
    ...        200

    # Criando dicionário para validação
    ${segment}    Create dictionary
    ...           name=Componentes e Suprimentos de Fabricação
    ...           id=31000000

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]    

    # Validando response body
    Should be equal as strings    ${response.json()}[0][name]    ${segment}[name]
    Should be equal as strings    ${response.json()}[0][id]      ${segment}[id]

Unauthorized
    [Tags]    api
    ...       segment_api
    ...       get_segment_by_filter
    ...       get_segment_by_filter_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Segment API    unauthorized

    # Buscando segmentos via nome
    GET API    ${segment_api}?filter=Componentes e Suprimentos de Fabricação
    ...        ${empty}
    ...        401

    # Validando response header
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]