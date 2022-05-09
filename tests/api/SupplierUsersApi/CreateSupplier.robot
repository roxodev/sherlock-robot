*Settings
Documentation    Create a supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Created
    [Tags]    api
    ...       supplier_users_api
    ...       create_supplier
    ...       create_supplier_created

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier      

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Validando supplier criado
    GET API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...        ${headers}
    ...        200

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200

Bad request
    [Tags]    api
    ...       supplier_users_api
    ...       create_supplier
    ...       create_supplier_bad_request

    # Criando novo supplier com os campos name e email inválidos
    [Template]    Bad request
    name          
    email

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       create_supplier
    ...       create_supplier_unauthorized

    # Instanciando massa de dados
    ${events}    Factory Supplier Users Api    events    

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier      

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${empty}                      
    ...         ${create_supplier_payload}
    ...         401

    # Validar mensagem de erro
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${events}    Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier

    # Populando payload com dados inválidos conforme chave informada
    Set to dictionary    ${create_supplier_payload}    
    ...                  ${chave}                      
    ...                  ${empty}

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][${chave}]    ${events}[${chave}]



