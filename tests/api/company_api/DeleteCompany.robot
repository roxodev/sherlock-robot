*Settings
Documentation    Delete company

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       company_api
    ...       delete_company
    ...       delete_company_success

    # Instanciando massa de dados
    ${success}    Factory Company API    success

    # Definindo payload
    ${create_company_payload}    Create Company    

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Deletando company criado
    DELETE API    ${company_api}/${response.json()}[id]    
    ...           ${headers}                               
    ...           ${empty}                                 
    ...           200

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

Not found
    [Tags]    api
    ...       company_api
    ...       delete_company
    ...       delete_company_not_found

    # Instanciando massa de dados
    ${not_found}    Factory Company API    not_found

    # Deletando company criado
    DELETE API    ${company_api}/c38e92fa-1b1f-4126-9f31-1b88746aa7e7    
    ...           ${headers} 
    ...           ${empty}                                               
    ...           404

    # Validando response header
    Should be equal as strings    ${response.reason}    ${not_found}[reason]

Unauthorized
    [Tags]    api
    ...       company_api
    ...       delete_company
    ...       delete_company_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Company API    unauthorized

    # Deletando company criado
    DELETE API    ${company_api}/c38e92fa-1b1f-4126-9f31-1b88746aa7e7    
    ...           ${empty} 
    ...           ${empty}                                               
    ...           401

    # Validando response header
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

