*Settings
Documentation    Create company

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Created
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_created

    # Instanciando massa de dados
    ${created}    Factory Company API    created

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

    # Validando response header
    Should be equal as strings    ${response.reason}    ${created}[reason]

    # Validando response body
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
Bad Request
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_bad_request

    [Template]       Bad request
    name
    corporateName
    documentCode
    street
    number
    neighborhood
    city
    country
    province
    complement
    postalCode

Unauthorized
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Company API    unauthorized

    # Definindo payload
    ${create_company_payload}    Create Company    

    # Criando novo company
    POST API    ${company_api}
    ...         ${empty}                     
    ...         ${create_company_payload}
    ...         401

    # Validando response header
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

*Keywords
Bad request
    [Arguments]    ${chave}

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando lista para controle de fluxo
    ${chaves}    Create List      
    ...          name
    ...          corporateName
    ...          documentCode

    # Criando condição para controle de fluxo
    ${condicao}=    Run Keyword And Return Status
    ...             List Should Contain Value        ${chaves}    ${chave}

    IF    ${condicao} == True 

    # Populando payload com dados inválidos
    Set to dictionary    ${create_company_payload}    
    ...                  ${chave}
    ...                  ${empty}

    ELSE

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       ${chave}

    END

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${errors}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${errors}    ${bad_request}[errors][${chave}]





