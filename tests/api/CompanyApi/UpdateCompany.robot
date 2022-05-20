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

Bad Request
    [Tags]    api
    ...       company_api
    ...       update_company
    ...       update_company_bad_request

    [Template]       Bad request
    name
    corporateName
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

*Keywords
Bad request
    [Arguments]    ${chave}

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

    # Retirando chaves desnecessárias
    Remove from dictionary    ${update_company_payload}
    ...                       documentType
    ...                       documentCode

    # Criação de lisya para controle de fluxo
    ${chaves}    Create List      
    ...          name
    ...          corporateName

    ${condicao}=    Run Keyword And Return Status
    ...             List Should Contain Value        ${chaves}    ${chave}

    IF    ${condicao} == True 

    # Populando payload com dados inválidos
    Set to dictionary    ${update_company_payload}    
    ...                  ${chave}
    ...                  ${empty}

    ELSE

    # Removendo chaves do payload
    Remove from dictionary    ${update_company_payload}[address]    
    ...                       ${chave}

    END

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
    Should contain    ${response_body}    ${bad_request}[errors][${chave}]





