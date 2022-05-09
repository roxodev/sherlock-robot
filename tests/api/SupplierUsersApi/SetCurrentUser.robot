*Settings
Documentation    Set current user

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       set_current_user
    ...       set_current_user_success

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

    # Criando access
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         201

    # Definindo novo payload
    ${set_current_user_payload}    Set Variable    ${create_access_payload} 

    # Definindo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${headers}                                                                                 
    ...         ${set_current_user_payload}
    ...         200

    # Consultando usuário
    GET API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${headers}
    ...        200

    # Criando dicionário
    ${current_user}    Set Variable    ${response.json()}[currentUser]

    # Removendo chaves desnecessárias
    Remove From Dictionary    ${current_user}
    ...                       created
    ...                       createdBy

    # Validando usuário atual
    Should be equal as strings    ${current_user}    ${set_current_user_payload}

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200

Bad request
    [Tags]    api
    ...       supplier_users_api
    ...       set_current_user
    ...       set_current_user_bad_request

    [Template]              Bad request
    invalidMeWebUserId
    notAccessMeWebUserId
    login

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       set_current_user
    ...       set_current_user_unauthorized

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
    ${create_access_payload}    Create Supplier Access

    # Criando access
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         201

    # Definindo novo payload
    ${set_current_user_payload}    Set Variable    ${create_access_payload}

    # Defininfo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${empty}                                                                                   
    ...         ${set_current_user_payload}
    ...         401

    # Validando usuário atual
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${set_current_user}    Factory Supplier Users API    set_current_user
    ${events}              Factory Supplier Users Api    events

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

    # Criando access
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         201

    # Definindo novo payload
    ${set_current_user_payload}    Set Variable    ${create_access_payload}

    IF    '${chave}' == 'invalidMeWebUserId'

    # Populando payload com dados inválidos
    Set to dictionary    ${set_current_user_payload}                             
    ...                  meWebUserId
    ...                  ${set_current_user}[bad_request][invalidMeWebUserId]

    # Definindo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${headers}                                                                                 
    ...         ${set_current_user_payload}
    ...         400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][meWebUserId]    ${events}[meWebUserId]    

    ELSE IF    '${chave}' == 'notAccessMeWebUserId'

    # Populando payload com dados inválidos
    Set to dictionary    ${create_access_payload}                                  
    ...                  meWebUserId
    ...                  ${set_current_user}[bad_request][notAccessMeWebUserId]

    # Definindo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${headers}                                                                                 
    ...         ${set_current_user_payload}
    ...         400

    # Validando evento
    Should be equal as strings    ${response.json()}[title]    ${events}[title]

    ELSE

    # Populando payload com dados inválidos
    Set to dictionary    ${create_access_payload}    
    ...                  ${chave}
    ...                  ${empty}

    # Definindo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${headers}                                                                                 
    ...         ${set_current_user_payload}
    ...         400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][${chave}]    ${events}[${chave}]

    END

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200



