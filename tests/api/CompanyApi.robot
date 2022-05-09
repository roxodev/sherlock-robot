*Settings
Documentation    Company API

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Get a company
    [Tags]    api
    ...       company_api
    ...       get_company

    # Instanciando massa de dados
    ${get_company}    Factory Company API    get_company

    # Definindo header e payload
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando company
    GET API    ${company_api}/${get_company}[id]
    ...        ${headers}                           
    ...        200

    Should be equal as strings    ${response.json()}    ${get_company}

Get a company by document
    [Tags]    api
    ...       company_api
    ...       get_company_by_document

    # Instanciando massa de dados
    ${get_company_by_document}    Factory Company API    get_company_by_document

    # Definindo header e payload
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Consultando company
    GET API    ${company_api}?documentType=${get_company_by_document}[documentType]&documentCode=${get_company_by_document}[documentCode]
    ...        ${headers}                                                                                                                    
    ...        200

    Should be equal as strings    ${response.json()}    ${get_company_by_document}[response]

Create a company
    [Tags]    api
    ...       company_api
    ...       create_company

    # Definindo header e payload
    ${headers}                   Create Dictionary    Authorization=Bearer ${access_token}
    ${create_company_payload}    Create Company       

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    ${create_company_response}    Set Variable    ${response.json()}

    # Consultando company criado
    GET API    ${company_api}/${create_company_response}[id]
    ...        ${headers}                                       
    ...        200

    Should be equal as strings    ${response.json()}    ${create_company_response}

Update a company
    [Tags]    api
    ...       company_api
    ...       update_company

    # Definindo header e payload
    ${headers}                   Create Dictionary    Authorization=Bearer ${access_token}
    ${create_company_payload}    Create Company       

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Capturando response do company criado
    ${create_company_response}    Set Variable    ${response.json()}    

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Atualizando company
    PUT API    ${company_api}/${create_company_response}[id]
    ...        ${headers}                                       
    ...        ${update_company_payload}
    ...        200

    # Capturando response do company atualizando
    ${update_company_response}    Set Variable    ${response.json()}

    # Consultando company criado
    GET API    ${company_api}/${update_company_response}[id]
    ...        ${headers}                                       
    ...        200

    Should be equal as strings    ${create_company_response}[id]    ${update_company_response}[id]
    Should be equal as strings    ${response.json()}                ${update_company_response}

Delete a company
    [Tags]    api
    ...       company_api
    ...       delete_company

    # Definindo header e payload
    ${headers}                   Create Dictionary    Authorization=Bearer ${access_token}
    ${create_company_payload}    Create Company       

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    ${create_company_response}    Set Variable    ${response.json()}

    # Consultando company criado
    GET API    ${company_api}/${create_company_response}[id]
    ...        ${headers}                                       
    ...        200

    Should be equal as strings    ${create_company_response}    ${response.json()}    

    # Deletando company criado
    DELETE API    ${company_api}/${create_company_response}[id]    
    ...           ${headers}                                       
    ...           200

    # Consultando company criado
    GET API    ${company_api}/${create_company_response}[id]
    ...        ${headers}                                       
    ...        404
