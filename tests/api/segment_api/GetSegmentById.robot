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
    ...       get_by_id_success

    # Instanciando massa de dados
    ${success}    Factory Segment API    success

    # Consultar segmento via id
    GET API    ${segment_api}/52000000
    ...        ${headers}
    ...        200

    # Criando dicionário para validação
    ${segment}    Create dictionary
    ...           id=52000000
    ...           name=Aparelhos Domésticos e Suprimentos e Produtos Eletrônicos de Consumo    

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Validando response body
    Should be equal as strings    ${response.json()}[id]      ${segment}[id]
    Should be equal as strings    ${response.json()}[name]    ${segment}[name]

No Content
    [Tags]    api
    ...       segment_api
    ...       get_segment_by_id
    ...       get_segment_by_id_no_content

    # Instanciando massa de dados
    ${no_content}    Factory Segment API    no_content

    # Consultar segmento via id
    GET API    ${segment_api}/00000000
    ...        ${headers}
    ...        204

    # Validando evento
    Should be equal as strings    ${response.reason}    ${no_content}[reason]

Unauthorized
    [Tags]    api
    ...       segment_api
    ...       get_segment_by_id
    ...       get_segment_by_id_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Segment API    unauthorized

    # Consultar segmento via id
    GET API    ${segment_api}/52000000
    ...        ${empty}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]