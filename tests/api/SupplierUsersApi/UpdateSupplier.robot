*Settings
Documentation    Update a supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       update_supplier
    ...       update_supplier_success

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
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

    # Validando supplier atualizado
    GET API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${headers}
    ...        200

    # Criando dicionário para validação
    ${updated_supplier}    Set Variable    ${response.json()}
    ${updated_accesses}    Set Variable    ${updated_supplier}[accessUsers][0]

    # Removendo chaves desnecessárias
    Remove from dictionary    ${updated_supplier}
    ...                       identityServerUserId
    ...                       email
    ...                       userCompanies

    Remove from dictionary    ${updated_accesses}
    ...                       created
    ...                       createdBy

    # Validando response
    Should be equal as strings    ${updated_supplier}[name]           ${update_supplier_payload}[name]
    Should be equal as strings    ${updated_supplier}[accessUsers]    ${update_supplier_payload}[accesses]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200

Bad request
    [Tags]    api
    ...       supplier_users_api
    ...       update_supplier
    ...       update_supplier_bad_request

    [Template]              Bad Request
    identityServerUserId
    name

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       update_supplier
    ...       update_supplier_unauthorized

    # Instanciando massa de dados
    ${events}    Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
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
    ...        ${empty}                                                                  
    ...        ${update_supplier_payload}
    ...        401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200



*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${update_supplier}    Factory Supplier Users API    update_supplier
    ${events}             Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api}
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${update_supplier_payload}    Update Supplier

    IF    '${chave}' == 'identityServerUserId'

    # Atualizando supplier
    PUT API    ${supplier_users_api}/${update_supplier}[bad_request][uuid]
    ...        ${headers}                                                     
    ...        ${update_supplier_payload}
    ...        400

    Should be equal as strings    ${response.json()}[errors][identityServerUserId]    ${events}[identityServerUserId]

    ELSE

    Set to dictionary    ${update_supplier_payload}
    ...                  ${chave}
    ...                  ${empty}

    # Atualizando supplier
    PUT API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${headers}                                                                
    ...        ${update_supplier_payload}
    ...        400

    Should be equal as strings    ${response.json()}[errors][${chave}]    ${events}[${chave}]

    END

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200
