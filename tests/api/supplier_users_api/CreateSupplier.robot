*Settings
Documentation    Create a supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
Test Setup     Capturar access token keycloak

*Test Cases
Created
    [Tags]    api
    ...       supplier_users_api
    ...       create_supplier
    ...       create_supplier_created

    # Instanciando massa de dados
    ${created}    Factory Supplier Users API    created

    # Definindo payload
    ${create_supplier_payload}    Create Supplier    

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Validando response header
    Should be equal as strings    ${response.reason}    ${created}[reason]

    # Validando response body
    Should be equal as strings    ${response.json()}[name]     ${create_supplier_payload}[name]
    Should be equal as strings    ${response.json()}[email]    ${create_supplier_payload}[email]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${response.json()}[identityServerUserId]
    ...           ${headers}                                                        
    ...           ${empty}                                                          
    ...           200

Name is required
    [Tags]    api
    ...       supplier_users_api
    ...       create_supplier
    ...       create_supplier_name_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users Api    bad_request

    # Definindo payload
    ${create_supplier_payload}    Create Supplier

    # Populando payload com dados inválidos
    Set to dictionary    ${create_supplier_payload}    
    ...                  name                          
    ...                  ${empty}

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
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
    ...       create_supplier
    ...       create_supplier_name_required

    # Instanciando massa de dados
    ${bad_request}    Factory Supplier Users Api    bad_request

    # Definindo payload
    ${create_supplier_payload}    Create Supplier

    # Populando payload com dados inválidos
    Set to dictionary    ${create_supplier_payload}    
    ...                  email                         
    ...                  ${empty}

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
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
    ...       create_supplier
    ...       create_supplier_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users Api    unauthorized    

    # Definindo payload
    ${create_supplier_payload}    Create Supplier    

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${empty}                      
    ...         ${create_supplier_payload}
    ...         401

    # Validar mensagem de erro
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

*Keywords
Bad request
    [Arguments]    ${chave}









