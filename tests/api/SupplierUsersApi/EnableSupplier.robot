*Settings
Documentation    Enable a supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Created
    [Tags]    api
    ...       supplier_users_api
    ...       enable_supplier
    ...       enable_supplier_created

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api}         
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${headers}                       
    ...         ${create_supplier_payload}
    ...         201

    # Validando response
    Should be equal as strings    ${response.json()}    ${create_supplier_payload}

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${response.json()}[identityServerUserId]
    ...           ${headers}                                                        
    ...           200

Bad request
    [Tags]    api
    ...       supplier_users_api
    ...       enable_supplier
    ...       enable_supplier_bad_request

    [Template]              Bad request
    identityServerUserId
    name
    email

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       enable_supplier
    ...       enable_supplier_unauthorized

    # Instanciando massa de dados
    ${enable_supplier}    Factory Supplier Users API    enable_supplier
    ${events}             Factory Supplier Users Api    events

    # Definindo header e payload
    ${create_supplier_payload}    Create Supplier

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${empty}                         
    ...         ${create_supplier_payload}
    ...         401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${enable_supplier}    Factory Supplier Users API    enable_supplier
    ${events}             Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier



    IF    '${chave}' == 'identityServerUserId'

    # Populando payload com dados inválidos conforme chave informada
    Set to dictionary    ${create_supplier_payload}               
    ...                  ${chave}
    ...                  ${enable_supplier}[bad_request][uuid]

    ELSE

    # Populando payload com dados inválidos conforme chave informada
    Set to dictionary    ${create_supplier_payload}    
    ...                  ${chave}                      
    ...                  ${empty}

    END

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${headers}                       
    ...         ${create_supplier_payload}
    ...         400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][${chave}]    ${events}[${chave}]


