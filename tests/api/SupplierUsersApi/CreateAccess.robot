*Settings
Documentation    Create a supplier access

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Created
    [Tags]    api
    ...       supplier_users_api
    ...       create_access
    ...       create_access_created

    # Definindo header
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier      

    # Criando novo supplier
    POST API    ${supplier_users_api}
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${create_access_payload}    Create Supplier Access

    # Criando novo access
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         201

    # Validando supplier access criado
    GET API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...        ${headers}
    ...        200

    # Validando access criado
    Should be equal as strings    ${response.json()}[0]    ${create_access_payload}

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200                                                                       

Bad request
    [Tags]    api
    ...       supplier_users_api
    ...       create_access
    ...       create_access_bad_request

    [Template]              Bad request
    identityServerUserId
    meWebUserId
    login

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       create_access
    ...       create_access_unauthorized

    # Instanciando massa de dados
    ${events}    Factory Supplier Users Api    events

    # Definindo header
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier 

    # Criando novo supplier
    POST API    ${supplier_users_api}
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${create_access_payload}    Create Supplier Access

    # Criando novo access
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${empty}                                                                           
    ...         ${create_access_payload}
    ...         401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${create_access}    Factory Supplier Users API    create_access
    ${events}           Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${create_access_payload}    Create Supplier Access

    IF    '${chave}' == 'identityServerUserId'

    # Habilitando supplier
    POST API    ${supplier_users_api}/${create_access}[bad_request][uuid]/accesses
    ...         ${headers}                                                            
    ...         ${create_access_payload}
    ...         400

    ELSE IF    '${chave}' == 'meWebUserId'

    # Populando payload com dados inválidos conforme chave informada
    Set to dictionary    ${create_access_payload}                      
    ...                  ${chave}                                      
    ...                  ${create_access}[bad_request][meWebUserId]

    # Habilitando supplier
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         400

    ELSE

    # Populando payload com dados inválidos conforme chave informada
    Set to dictionary    ${create_access_payload}    
    ...                  ${chave}                    
    ...                  ${empty}

    # Habilitando supplier
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         400

    END

    # Validando evento
    Should be equal as strings    ${events}[${chave}]    ${response.json()}[errors][${chave}]