*Settings
Documentation    Create company

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
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
    ...           ${empty}                                 
    ...           200

Name is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_name_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Populando payload com dados inválidos
    Set to dictionary    ${create_company_payload}    
    ...                  name
    ...                  ${empty}

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
    Should contain    ${errors}    ${bad_request}[errors][name]

Corporate name is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_corporate_name_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Populando payload com dados inválidos
    Set to dictionary    ${create_company_payload}    
    ...                  corporateName
    ...                  ${empty}

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
    Should contain    ${errors}    ${bad_request}[errors][corporateName]

Document code is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_document_code_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Populando payload com dados inválidos
    Set to dictionary    ${create_company_payload}    
    ...                  documentCode
    ...                  ${empty}

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
    Should contain    ${errors}    ${bad_request}[errors][documentCode]

Document type is invalid
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_document_type_invalid

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Populando payload com dados inválidos
    Set to dictionary    ${create_company_payload}    
    ...                  documentType
    ...                  5

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
    Should contain    ${errors}    ${bad_request}[errors][documentType]

Street field is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_street_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       street

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
    Should contain    ${errors}    ${bad_request}[errors][street]


Number field is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_number_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       number

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
    Should contain    ${errors}    ${bad_request}[errors][number]

Neighborhood field is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_neighborhood_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       neighborhood

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
    Should contain    ${errors}    ${bad_request}[errors][neighborhood]

City field is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_city_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       city

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
    Should contain    ${errors}    ${bad_request}[errors][city]

Country field is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_country_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       country

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
    Should contain    ${errors}    ${bad_request}[errors][country]

Province field is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_province_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       province

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
    Should contain    ${errors}    ${bad_request}[errors][province]

Complement field is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_complement_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       complement

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
    Should contain    ${errors}    ${bad_request}[errors][complement]

Postal code field is required
    [Tags]    api
    ...       company_api
    ...       create_company
    ...       create_company_postal_code_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${create_company_payload}[address]    
    ...                       postalCode

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
    Should contain    ${errors}    ${bad_request}[errors][postalCode]

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




