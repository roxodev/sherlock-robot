*Settings
Documentation    Delete a supplier access

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente API
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       delete_access
    ...       delete_access_success

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${create_access_payload}    Create Supplier Access

    # Criando supplier access
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         201

    # Deletando supplier access
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses/${create_access_payload}[meWebUserId]
    ...           ${headers}                                                                                                                
    ...           200

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           200

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       delete_access
    ...       delete_access_unauthorized

    #Instanciando massa de dados
    ${delete_access}    Factory Supplier Users API    delete_access
    ${events}           Factory Supplier Users Api    events 

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${create_access_payload}    Create Supplier Access

    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         201

    # Deletando supplier access
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses/${create_access_payload}[meWebUserId]
    ...           ${empty}                                                                                                                  
    ...           401

    # Validando evento
    Should be equal as strings    ${response.reason}    ${events}[unauthorized]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                 
    ...           200

Not Found
    [Tags]    api
    ...       supplier_users_api
    ...       delete_access
    ...       delete_access_not_found

    #Instanciando massa de dados
    ${delete_access}    Factory Supplier Users API    delete_access
    ${events}           Factory Supplier Users Api    events

    # Definindo header e payload
    ${headers}                    Create Dictionary    Authorization=Bearer ${access_token}
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${create_access_payload}    Create Supplier Access

    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                       
    ...         ${create_access_payload}
    ...         201

    # Deletando supplier access
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses/${delete_access}[not_found][meWebUserId]
    ...           ${headers}                                                                                                                
    ...           404

    # Permite deletar mesmo que o meWebUserId informado não exista no cadastro do supplier

    Should be equal as strings    ${response.reason}    ${events}[not_found]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                 
    ...           200
