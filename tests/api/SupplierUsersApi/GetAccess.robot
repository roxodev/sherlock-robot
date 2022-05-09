*Settings
Documentation    Get accesses

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       get_accesses
    ...       get_accesses_success

    # Instanciando massa de dados
    ${get_accesses}    Factory Supplier Users API    get_accesses

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando supplier accessess
    GET API    ${supplier_users_api}/${get_accesses}[success][uuid]/accesses    
    ...        ${headers}
    ...        200

    # Validando response
    Should be equal as strings    ${response.json()}    ${get_accesses}[success][response]

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       get_accesses
    ...       get_accesses_unauthorized

    # Instanciando massa de dados
    ${get_accesses}    Factory Supplier Users API    get_accesses
    ${events}          Factory Supplier Users Api    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando supplier accessess
    GET API    ${supplier_users_api}/${get_accesses}[unauthorized][uuid]/accesses    
    ...        ${empty}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

Not found
    [Tags]    api
    ...       supplier_users_api
    ...       get_accesses
    ...       get_accesses_not_found

    # Instanciando massa de dados
    ${get_accesses}    Factory Supplier Users API    get_accesses
    ${events}          Factory Supplier Users Api    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando supplier accessess
    GET API    ${supplier_users_api}/${get_accesses}[not_found][uuid]/accesses    
    ...        ${headers}
    ...        404

    # Validar mensagem de erro
    Should be equal as strings    ${response.reason}    ${events}[not_found]