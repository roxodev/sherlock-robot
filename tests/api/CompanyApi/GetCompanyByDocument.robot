*Settings
Documentation    Get company by document

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       company_api
    ...       get_company_by_document
    ...       get_company_by_document_success

    # Instanciando massa de dados
    ${success}    Factory Company API    success

    # Definindo payload
    ${create_company_payload}    Create Company    

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Retirando caracteres especiais
    ${document_code}=    Remove string    ${create_company_payload}[documentCode]
    ...                  .
    ...                  /
    ...                  -

    # Consultando company
    GET API    ${company_api}?documentType=${create_company_payload}[documentType]&documentCode=${create_company_payload}[documentCode]
    ...        ${headers}                                                                                                                  
    ...        200

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Validando response body
    Should be equal as strings    ${response.json()}[name]                     ${create_company_payload}[name]
    Should be equal as strings    ${response.json()}[name]                     ${create_company_payload}[name]
    Should be equal as strings    ${response.json()}[corporateName]            ${create_company_payload}[corporateName]
    Should be equal as strings    ${response.json()}[document][code]           ${document_code}
    Should be equal as strings    ${response.json()}[address][street]          ${create_company_payload}[address][street]
    Should be equal as strings    ${response.json()}[address][number]          ${create_company_payload}[address][number]
    Should be equal as strings    ${response.json()}[address][neighborhood]    ${create_company_payload}[address][neighborhood]
    Should be equal as strings    ${response.json()}[address][city]            ${create_company_payload}[address][city]
    Should be equal as strings    ${response.json()}[address][country]         ${create_company_payload}[address][country]
    Should be equal as strings    ${response.json()}[address][province]        ${create_company_payload}[address][province]
    Should be equal as strings    ${response.json()}[address][complement]      ${create_company_payload}[address][complement]
    Should be equal as strings    ${response.json()}[address][postalCode]      ${create_company_payload}[address][postalCode]

    # Deletando company criado
    DELETE API    ${company_api}/${response.json()}[id]    
    ...           ${headers}                               
    ...           200
    
Bad request
    [Tags]    api
    ...       company_api
    ...       get_company_by_document
    ...       get_company_by_document_bad_request

    [Template]      Bad request
    documentType
    documentCode

Not Found
    [Tags]    api
    ...       company_api
    ...       get_company_by_document
    ...       get_company_by_document_not_found

    # Instanciando massa de dados
    ${not_found}    Factory Company API    not_found

    # Definindo payload
    ${create_company_payload}    Create Company    

    # Consultando company
    GET API    ${company_api}?documentType=${create_company_payload}[documentType]&documentCode=80354217000139
    ...        ${headers}                                                                                         
    ...        404

    # Validando response header
    Should be equal as strings    ${response.reason}    ${not_found}[reason]

Unauthorized
    [Tags]    api
    ...       company_api
    ...       get_company_by_document
    ...       get_company_by_document_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Company API    unauthorized

    # Definindo payload
    ${create_company_payload}    Create Company

    # Consultando company
    GET API    ${company_api}?documentType=${create_company_payload}[documentType]&documentCode=${create_company_payload}[documentCode]
    ...        ${empty}                                                                                                                    
    ...        401

    # Validando response header
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company    

    # Retirando caracteres especiais
    ${document_code}=    Remove string    ${create_company_payload}[documentCode]
    ...                  .
    ...                  /
    ...                  -

    # Populando payload com valores inválidos
    Set to dictionary    ${create_company_payload}
    ...                  ${chave}
    ...                  ${empty}

    # Consultando company
    GET API    ${company_api}?documentType=${create_company_payload}[documentType]&documentCode=${create_company_payload}[documentCode]
    ...        ${headers}                                                                                                                  
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${errors}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${errors}    ${bad_request}[errors][${chave}]



