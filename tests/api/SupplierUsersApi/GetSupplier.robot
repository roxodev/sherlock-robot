*Settings
Documentation    Get supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       get_supplier
    ...       get_supplier_success

    # Instanciando massa de dados
    ${get_supplier}    Factory Supplier Users API    get_supplier

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando supplier
    GET API    ${supplier_users_api}/${get_supplier}[success][uuid]    
    ...        ${headers}
    ...        200

    # Criando dicionário para validação
    ${supplier}    Set Variable    ${response.json()}

    # Removendo chaves desnecessárias
    Remove from dictionary    ${supplier}
    ...                       currentUser
    ...                       accessUsers
    ...                       userCompanies

    # Validando response
    Should be equal as strings    ${supplier}    ${get_supplier}[success][response]

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       get_supplier
    ...       get_supplier_unauthorized

    # Instanciando massa de dados
    ${get_supplier}    Factory Supplier Users API    get_supplier
    ${events}          Factory Supplier Users Api    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando supplier
    GET API    ${supplier_users_api}/${get_supplier}[unauthorized][uuid]    
    ...        ${empty}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

Not found
    [Tags]    api
    ...       supplier_users_api
    ...       get_supplier
    ...       get_supplier_not_found

    # Instanciando massa de dados
    ${get_supplier}    Factory Supplier Users API    get_supplier
    ${events}          Factory Supplier Users Api    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando supplier
    GET API    ${supplier_users_api}/${get_supplier}[not_found][uuid]    
    ...        ${empty}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]