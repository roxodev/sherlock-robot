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
    ${success}    Factory Supplier Users API    success

    # Consultando suppliers via email
    POST API    ${supplier_users_api}/relation?email=lucas.roxo@me.com.br
    ...         ${headers}                                                   
    ...         ${empty}
    ...         200

    # Convertendo response body para string
    ${response_body}=    Convert to string    ${response.json()}

    # Criando lista para validação
    @{users}    Create list 
    ...         3643278
    ...         4027082

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    FOR    ${user}    IN    @{users}

    # Validando response
    Should contain    ${response_body}    ${user}

    END

Bad Request
    [Tags]    api
    ...       supplier_users_api
    ...       return_users
    ...       return_users_bad_request

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users API    bad_request

    # Consultando suppliers via email
    POST API    ${supplier_users_api}/relation?email=
    ...         ${headers}                               
    ...         ${empty}
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
    ...       return_users
    ...       return_users_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users Api    unauthorized

    # Consultando suppliers via email
    POST API    ${supplier_users_api}/relation?email=
    ...         ${empty}                                 
    ...         ${empty}
    ...         401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]