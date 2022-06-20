*Settings
Documentation    Set current user

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       set_current_user
    ...       set_current_user_success

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
    ${create_access_payload}    Create Supplier Access

    # Criando access
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         201

    # Definindo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${headers}                                                                                 
    ...         ${create_access_payload}
    ...         200

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Consultando usuário
    GET API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${headers}
    ...        200

    # Validando response body
    Should be equal as strings    ${response.json()}[accessUsers][0][meWebUserId]    ${create_access_payload}[meWebUserId]    

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           ${empty}                                                                  
    ...           200

MeWebUserId is invalid
    [Tags]    api
    ...       supplier_users_api
    ...       set_current_user
    ...       set_current_user_meweb_id_invalid

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users API    bad_request

    # Definindo payload
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

    # Populando paylod com dados inválidos
    Set to dictionary    ${create_access_payload}    
    ...                  meWebUserId
    ...                  0

    # Definindo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${headers}                                                                                 
    ...         ${create_access_payload}
    ...         400

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][meWebUserId]


Supplier user does not have this access
    [Tags]    api
    ...       supplier_users_api
    ...       set_current_user
    ...       set_current_user_access_not_found

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users API    bad_request

    # Definindo payload
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

    # Populando paylod com dados inválidos
    Set to dictionary    ${create_access_payload}    
    ...                  meWebUserId
    ...                  1234

    # Definindo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${headers}                                                                                 
    ...         ${create_access_payload}
    ...         400

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][accessNotFound]

Login is required
    [Tags]    api
    ...       supplier_users_api
    ...       set_current_user
    ...       set_current_user_login_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users API    bad_request

    # Definindo payload
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

    # Populando paylod com dados inválidos
    Set to dictionary    ${create_access_payload}    
    ...                  login
    ...                  ${empty}

    # Definindo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${headers}                                                                                 
    ...         ${create_access_payload}
    ...         400

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][login]

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       set_current_user
    ...       set_current_user_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users Api    unauthorized

    # Definindo novo payload
    ${create_supplier_payload}    Create Supplier
    ${create_access_payload}      Create Supplier Access

    # Defininfo usuário atual
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/set-current-user
    ...         ${empty}                                                                                   
    ...         ${create_access_payload}
    ...         401

    # Validando usuário atual
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]



