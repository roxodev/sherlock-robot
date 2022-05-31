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

    # Instanciando massa de dados
    ${created}    Factory Supplier Users API    created

    # Definindo payload
    ${enable_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api}         
    ...         ${headers}                    
    ...         ${enable_supplier_payload}
    ...         201

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${headers}                       
    ...         ${enable_supplier_payload}
    ...         201

    # Validando response header
    Should be equal as strings    ${response.reason}    ${created}[reason]

    # Validando response body
    Should be equal as strings    ${response.json()}    ${enable_supplier_payload}

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${response.json()}[identityServerUserId]
    ...           ${headers}                                                        
    ...           200

Identity Server User Id is required
    [Tags]    api
    ...       supplier_users_api
    ...       enable_supplier
    ...       enable_supplier_uuid_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users Api    bad_request

    # Definindo payload
    ${enable_supplier_payload}    Create Supplier

    # Populando payload com dados inválidos
    Set to dictionary    ${enable_supplier_payload}              
    ...                  identityServerUserId
    ...                  00000000-0000-0000-0000-000000000000

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${headers}                       
    ...         ${enable_supplier_payload}
    ...         400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${errors}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${errors}    ${bad_request}[errors][identityServerUserId]

Name is required
    [Tags]    api
    ...       supplier_users_api
    ...       enable_supplier
    ...       enable_supplier_name_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users Api    bad_request

    # Definindo payload
    ${enable_supplier_payload}    Create Supplier

    # Populando payload com dados inválidos
    Set to dictionary    ${enable_supplier_payload}    
    ...                  name
    ...                  ${empty}

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${headers}                       
    ...         ${enable_supplier_payload}
    ...         400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${errors}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${errors}    ${bad_request}[errors][name]

Email is required
    [Tags]    api
    ...       supplier_users_api
    ...       enable_supplier
    ...       enable_supplier_email_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users Api    bad_request

    # Definindo payload
    ${enable_supplier_payload}    Create Supplier

    # Populando payload com dados inválidos
    Set to dictionary    ${enable_supplier_payload}    
    ...                  email
    ...                  ${empty}

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${headers}                       
    ...         ${enable_supplier_payload}
    ...         400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${errors}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${errors}    ${bad_request}[errors][email]

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       enable_supplier
    ...       enable_supplier_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users Api    unauthorized

    # Definindo payload
    ${enable_supplier_payload}    Create Supplier

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${empty}                         
    ...         ${enable_supplier_payload}
    ...         401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

*Keywords
Bad request
    [Arguments]    ${chave}



    # Populando payload com dados inválidos conforme chave informada
    IF    '${chave}' == 'identityServerUserId'



    ELSE

    Set to dictionary    ${enable_supplier_payload}    
    ...                  ${chave}                      
    ...                  ${empty}

    END

    # Habilitando supplier
    POST API    ${supplier_users_api}/enable 
    ...         ${headers}                       
    ...         ${enable_supplier_payload}
    ...         400




