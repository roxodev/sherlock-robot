*Settings
Documentation    Delete a supplier

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       delete_supplier
    ...       delete_supplier_success

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       delete_supplier
    ...       delete_supplier_unauthorized

    # Instanciando massa de dados
    ${delete_supplier}    Factory Supplier Users API    delete_supplier
    ${events}             Factory Supplier Users Api    events

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${delete_supplier}[unauthorized][uuid]
    ...           ${empty}                                                        
    ...           401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized] 

Not Found
    [Tags]    api
    ...       supplier_users_api
    ...       delete_supplier
    ...       delete_supplier_not_found

    # Instanciando massa de dados
    ${delete_supplier}    Factory Supplier Users API    delete_supplier
    ${events}             Factory Supplier Users Api    events

    # Definindo header
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${delete_supplier}[not_found][uuid]
    ...           ${headers}                                                   
    ...           404

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[not_found]