*Settings
Documentation    Update a company

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_success

    # Instanciando massa de dados
    ${success}    Factory Company API    success

    # Definindo payload
    ${create_company_payload}    Create Company    

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Retirando chaves desnecessárias
    Remove from dictionary    ${update_company_payload}
    ...                       documentType
    ...                       documentCode

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        200

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Validando response body
    Should be equal as strings    ${response.json()}[name]                     ${update_company_payload}[name]
    Should be equal as strings    ${response.json()}[corporateName]            ${update_company_payload}[corporateName]
    Should be equal as strings    ${response.json()}[address][street]          ${update_company_payload}[address][street]
    Should be equal as strings    ${response.json()}[address][number]          ${update_company_payload}[address][number]
    Should be equal as strings    ${response.json()}[address][neighborhood]    ${update_company_payload}[address][neighborhood]
    Should be equal as strings    ${response.json()}[address][city]            ${update_company_payload}[address][city]
    Should be equal as strings    ${response.json()}[address][country]         ${update_company_payload}[address][country]
    Should be equal as strings    ${response.json()}[address][province]        ${update_company_payload}[address][province]
    Should be equal as strings    ${response.json()}[address][complement]      ${update_company_payload}[address][complement]
    Should be equal as strings    ${response.json()}[address][postalCode]      ${update_company_payload}[address][postalCode]

    # Deletando company criado
    DELETE API    ${company_api}/${response.json()}[id]    
    ...           ${headers}                               
    ...           200

Name is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_name_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Populando payload com dados inválidos
    Set to dictionary    ${update_company_payload}    
    ...                  name
    ...                  ${empty}

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][name]

Corporate name is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_corporate_name_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Populando payload com dados inválidos
    Set to dictionary    ${update_company_payload}    
    ...                  corporateName
    ...                  ${empty}

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][corporateName]

Street field is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_street_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       street

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][street]

Number field is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_number_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       number

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][number]

Neighborhood field is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_neighborhood_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       neighborhood

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][neighborhood]

City field is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_city_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       city

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][city]

Country field is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_country_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       country

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][country]

Province field is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_province_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       province

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][province]

Complement field is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_complement_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       complement

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][complement]

PostalCode field is required
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_postal_code_required

    # Instanciando massa de dados
    ${bad_request}    Factory Company API    bad_request

    # Definindo payload
    ${create_company_payload}    Create Company

    # Criando novo company
    POST API    ${company_api}
    ...         ${headers}                   
    ...         ${create_company_payload}
    ...         201

    # Definindo novo payload
    ${update_company_payload}    Create Company

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       postalCode

    # Atualizando company
    PUT API    ${company_api}/${response.json()}[id]
    ...        ${headers}                               
    ...        ${update_company_payload}
    ...        400

    # Validando response header
    Should be equal as strings    ${response.reason}    ${bad_request}[reason]

    # Convertendo response body para string
    ${response_body}=    Convert To String    ${response.json()}[errors]

    # Validando response body
    Should contain    ${response_body}    ${bad_request}[errors][postalCode]

Unauthorized
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Company API    unauthorized

    # Definindo payload
    ${update_company_payload}    Create Company    

    # Atualizando company
    PUT API    ${company_api}/a026f665-409b-489a-a918-3146255efac7
    ...        ${empty}                                               
    ...        ${update_company_payload}
    ...        401

    # Validando response header
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]










