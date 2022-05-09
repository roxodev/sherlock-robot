*Settings
Documentation    Return buyers by supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       return_users
    ...       return_users_success

    # Instanciando massa de dados
    ${return_users}    Factory Supplier Users API    return_users

    # Definindo header e payload
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando suppliers via email
    POST API    ${supplier_users_api}/relation?email=${return_users}[email]
    ...         ${headers}                                                     
    ...         ${empty}
    ...         200

    # Validando response
    Should be equal as strings    ${response.json()}    ${return_users}[response]

Bad Request
    [Tags]    api
    ...       supplier_users_api
    ...       return_users
    ...       return_users_bad_request

    # Instanciando massa de dados
    ${events}    Factory Supplier Users Api    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando suppliers via email
    POST API    ${supplier_users_api}/relation?email=
    ...         ${headers}                               
    ...         ${empty}
    ...         400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][email]    ${events}[email]

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       return_users
    ...       return_users_unauthorized

    # Instanciando massa de dados
    ${events}    Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando suppliers via email
    POST API    ${supplier_users_api}/relation?email=
    ...         ${empty}                                 
    ...         ${empty}
    ...         401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${return_buyers}    Factory Supplier Users API    return_buyers
    ${events}           Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                  Create Dictionary    Authorization=Bearer ${access_token}
    ${return_buyers_payload}    Set Variable         ${return_buyers}[payload]

    # Populando payload com dados inválidos conforme chave informada
    Set to dictionary    ${return_buyers_payload}    
    ...                  ${chave}                    
    ...                  ${empty}

    # Criando novo supplier
    POST API    ${supplier_users_api}/buyers
    ...         ${headers}                      
    ...         ${return_buyers_payload}
    ...         400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][${chave}]    ${events}[${chave}]