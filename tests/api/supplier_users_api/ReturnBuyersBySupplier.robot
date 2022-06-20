*Settings
Documentation    Return buyers by supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       return_buyers
    ...       return_buyers_success

    # Instanciando massa de dados
    ${success}    Factory Supplier Users API    success

    # Definindo payload
    ${return_buyers_payload}    Create dictionary
    ...                         email=lucas.roxo@me.com.br    

    # Consultando buyer associado ao supplier
    POST API    ${supplier_users_api}/buyers
    ...         ${headers}                      
    ...         ${return_buyers_payload}
    ...         200

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Criando lista para validação
    @{buyers}    Create list
    ...          WF - BRASALPLA
    ...          Demonstração FAST

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Validando response body
    FOR    ${buyer}    IN    @{buyers}    

    Should contain    ${response_body}    ${buyer}

    END

Email is required
    [Tags]    api
    ...       supplier_users_api
    ...       return_buyers
    ...       return_buyers_email_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users API    bad_request

    # Definindo payload
    ${return_buyers_payload}    Create dictionary
    ...                         email=${empty}

    # Consultando buyers
    POST API    ${supplier_users_api}/buyers
    ...         ${headers}                      
    ...         ${return_buyers_payload}
    ...         400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][email]

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       return_buyers
    ...       return_buyers_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users API    unauthorized

    # Definindo payload
    ${return_buyers_payload}    Create dictionary
    ...                         email=lucas.roxo@me.com.br

    # Consultando buyer associado ao supplier
    POST API    ${supplier_users_api}/buyers
    ...         ${empty}                        
    ...         ${return_buyers_payload}
    ...         401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]




