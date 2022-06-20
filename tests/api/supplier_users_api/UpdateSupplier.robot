*Settings
Documentation    Update a supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       update_supplier
    ...       update_supplier_success

    # Instanciando massa de dados
    ${success}    Factory Supplier Users API    success

    # Definindo payload
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api}
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${update_supplier_payload}    Update Supplier

    # Atualizando supplier
    PUT API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${headers}                                                                
    ...        ${update_supplier_payload}
    ...        200

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Validando response
    Should be equal as strings    ${response.json()}[name]                           ${update_supplier_payload}[name]
    Should be equal as strings    ${response.json()}[accessUsers][0][meWebUserId]    ${update_supplier_payload}[accesses][0][meWebUserId]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           ${empty}                                                                  
    ...           200

Identity Server User Id is required
    [Tags]    api
    ...       supplier_users_api
    ...       update_supplier
    ...       update_supplier_uuid_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users API    bad_request

    # Definindo payload
    ${update_supplier_payload}    Update Supplier

    # Atualizando supplier
    PUT API    ${supplier_users_api}/00000000-0000-0000-0000-000000000000
    ...        ${headers}                                                    
    ...        ${update_supplier_payload}
    ...        400

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][identityServerUserId]

Name is required
    [Tags]    api
    ...       supplier_users_api
    ...       update_supplier
    ...       update_supplier_name_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users API    bad_request

    # Definindo payload
    ${create_supplier_payload}    Create Supplier
    ${update_supplier_payload}    Update Supplier

    # Populando payload com dados inválidos
    Set to dictionary    ${update_supplier_payload}
    ...                  name
    ...                  ${empty}

    # Atualizando supplier
    PUT API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${headers}                                                                
    ...        ${update_supplier_payload}
    ...        400

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][name]

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       update_supplier
    ...       update_supplier_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users API    unauthorized

    # Definindo payload
    ${create_supplier_payload}    Create Supplier
    ${update_supplier_payload}    Update Supplier

    # Atualizando supplier
    PUT API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${empty}                                                                  
    ...        ${update_supplier_payload}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

*Keywords
Bad request
    [Arguments]    ${chave}


    ELSE



    END

    # Atualizando supplier
    PUT API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${headers}                                                                
    ...        ${update_supplier_payload}
    ...        400


