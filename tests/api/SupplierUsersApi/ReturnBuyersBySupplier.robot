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
    ...       return_buyers
    ...       return_buyers_success

    # Instanciando massa de dados
    ${return_buyers}    Factory Supplier Users API    return_buyers

    # Definindo header e payload
    ${headers}                  Create Dictionary    Authorization=Bearer ${access_token}
    ${return_buyers_payload}    Set Variable         ${return_buyers}[payload]               

    # Consultando buyer associado ao supplier
    POST API    ${supplier_users_api}/buyers
    ...         ${headers}                      
    ...         ${return_buyers_payload}
    ...         200

    # Validando response
    Should be equal as strings    ${response.json()}    ${return_buyers}[response]

Bad Request
    [Tags]    api
    ...       supplier_users_api
    ...       return_buyers
    ...       return_buyers_bad_request

    # Instanciando massa de dados
    ${return_buyers}    Factory Supplier Users API    return_buyers
    ${events}           Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                  Create Dictionary    Authorization=Bearer ${access_token}
    ${return_buyers_payload}    Set Variable         ${return_buyers}[payload]

    # Populando payload com valores inválidos
    Set to dictionary    ${return_buyers_payload}    
    ...                  email                       
    ...                  ${empty}

    # Consultando buyers
    POST API    ${supplier_users_api}/buyers
    ...         ${headers}                      
    ...         ${return_buyers_payload}
    ...         400

    # Validando evento
    Should be equal as strings    ${response.json()}[errors][email]    ${events}[email]



Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       return_buyers
    ...       return_buyers_unauthorized

    # Instanciando massa de dados
    ${return_buyers}    Factory Supplier Users API    return_buyers
    ${events}           Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                  Create Dictionary    Authorization=Bearer ${access_token}
    ${return_buyers_payload}    Set Variable         ${return_buyers}[payload]               

    # Consultando buyer associado ao supplier
    POST API    ${supplier_users_api}/buyers
    ...         ${empty}                        
    ...         ${return_buyers_payload}
    ...         401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]




