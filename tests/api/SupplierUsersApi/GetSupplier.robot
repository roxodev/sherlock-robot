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
    ${success}    Factory Supplier Users API    success

    # Consultando supplier
    GET API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f
    ...        ${headers}
    ...        200

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Criando lista para validação
    @{supplier_infos}    Create list
    ...                  d714faaf-af05-4590-86c9-1dbd94a1088f
    ...                  Lucas Roxo
    ...                  lucas.roxo@me.com.br

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Validando response body
    FOR    ${supplier_info}    IN    @{supplier_infos}

    Should contain    ${response_body}    ${supplier_info}

    END

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       get_supplier
    ...       get_supplier_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users API    unauthorized

    # Consultando supplier
    GET API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f    
    ...        ${empty}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

Not found
    [Tags]    api
    ...       supplier_users_api
    ...       get_supplier
    ...       get_supplier_not_found

    # Instanciando massa de dados
    ${not_found}    Factory Supplier Users API    not_found

    # Consultando supplier
    GET API    ${supplier_users_api}/a0144c8d-a0dc-4296-becd-769f458cfa1e    
    ...        ${headers}
    ...        404

    # Validando evento
    Should be equal as strings    ${response.reason}    ${not_found}[reason]