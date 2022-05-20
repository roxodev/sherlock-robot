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

    # Instanciando massa de dados
    ${created}    Factory Supplier Users API    created

    # Definindo payload
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

    # Validando response header
    Should be equal as strings    ${response.reason}    ${created}[reason]

    # Validando response body
    Should be equal as strings    ${response.json()}[meWebUserId]    ${create_access_payload}[meWebUserId]
    Should be equal as strings    ${response.json()}[login]          ${create_access_payload}[login]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${response.json()}[identityServerUserId]
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
    ${unauthorized}    Factory Supplier Users Api    unauthorized

    # Definindo payload
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

    # Validando response header
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users API    bad_request

    # Definindo payload
    ${create_supplier_payload}    Create Supplier
    ${create_access_payload}      Create Supplier Access

    # Populando payload com dados inválidos conforme chave informada

    IF    '${chave}' == 'identityServerUserId'

    Set to dictionary    ${create_supplier_payload}              
    ...                  ${chave}                                
    ...                  00000000-0000-0000-0000-000000000000

    ELSE IF    '${chave}' == 'meWebUserId'

    Set to dictionary    ${create_access_payload}    
    ...                  ${chave}                    
    ...                  0

    ELSE

    Set to dictionary    ${create_access_payload}    
    ...                  ${chave}                    
    ...                  ${empty}

    END

    # Habilitando supplier
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${errors}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${errors}    ${bad_request}[errors][${chave}]