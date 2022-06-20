*Settings
Documentation    Delete a supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       delete_supplier
    ...       delete_supplier_success

    # Instanciando massa de dados
    ${success}    Factory Supplier Users API    success

    # Definindo payload
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${response.json()}[identityServerUserId]
    ...           ${headers}                                                        
    ...           ${empty}                                                          
    ...           200

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       delete_supplier
    ...       delete_supplier_unauthorized

    # Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users Api    unauthorized

    # Deletando supplier
    DELETE API    ${supplier_users_api}/3fa85f64-5717-4562-b3fc-2c963f66afa
    ...           ${empty}                                                     
    ...           ${empty}                                                     
    ...           401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason] 

Not Found
    [Tags]    api
    ...       supplier_users_api
    ...       delete_supplier
    ...       delete_supplier_not_found

    # Instanciando massa de dados
    ${not_found}    Factory Supplier Users Api    not_found

    # Deletando supplier
    DELETE API    ${supplier_users_api}/a0144c8d-a0dc-4296-becd-769f458cfa1e
    ...           ${headers}                                                    
    ...           ${empty}                                                      
    ...           404

    # Validando evento
    Should be equal as strings    ${response.reason}    ${not_found}[reason]