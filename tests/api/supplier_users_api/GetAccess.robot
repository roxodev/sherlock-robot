*Settings
Documentation    Get accesses

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       get_accesses
    ...       get_accesses_success

    # Instanciando massa de dados
    ${success}    Factory Supplier Users API    success

    # Consultando supplier accessess
    GET API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f/accesses    
    ...        ${headers}
    ...        200

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}

    # Criando lista para validação
    @{meWebUserIds}    Create List
    ...                2729

    # Validando response body
    FOR    ${meWebUserId}    IN    @{meWebUserIds}

    Should contain    ${response_body}    ${meWebUserId}

    END

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       get_accesses
    ...       get_accesses_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users API    unauthorized

    # Consultando supplier accessess
    GET API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f/accesses    
    ...        ${empty}
    ...        401

    # Validando response header
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

Not found
    [Tags]    api
    ...       supplier_users_api
    ...       get_accesses
    ...       get_accesses_not_found

    # Instanciando massa de dados
    ${not_found}    Factory Supplier Users API    not_found

    # Consultando supplier accessess
    GET API    ${supplier_users_api}/a0144c8d-a0dc-4296-becd-769f458cfa1e/accesses    
    ...        ${headers}
    ...        404

    # Validando response header
    Should be equal as strings    ${response.reason}    ${not_found}[reason]