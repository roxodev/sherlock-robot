*Settings
Documentation    Delete a supplier access

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

# Setup
Suite Setup    Configurar ambiente
Test Setup     Capturar access token keycloak

*Test Cases
Success
    [Tags]    api
    ...       supplier_users_api
    ...       delete_access
    ...       delete_access_success

    # Instanciando massa de dados
    ${success}    Factory Supplier Users API    success

    # Definindo payload
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
    ...           ${empty}                                                                                                                 
    ...           200

    # Validando response header
    Should be equal as strings    ${response.reason}    ${success}[reason]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           ${empty}                                                                  
    ...           200

Unauthorized
    [Tags]    api
    ...       supplier_users_api
    ...       delete_access
    ...       delete_access_unauthorized

    #Instanciando massa de dados
    ${unauthorized}    Factory Supplier Users Api    unauthorized 

    # Definindo payload
    ${create_supplier_payload}    Create Supplier

    # Criando novo supplier
    POST API    ${supplier_users_api} 
    ...         ${headers}                    
    ...         ${create_supplier_payload}
    ...         201

    # Definindo novo payload
    ${create_access_payload}    Create Supplier Access

    # Criando novo access
    POST API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses
    ...         ${headers}                                                                         
    ...         ${create_access_payload}
    ...         201

    # Deletando supplier access
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses/${create_access_payload}[meWebUserId]
    ...           ${empty}                                                                                                                 
    ...           ${empty}                                                                                                                 
    ...           401

    # Validando response header
    Should be equal as strings    ${response.reason}    ${unauthorized}[reason]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           ${empty}                                                                  
    ...           200

Not Found
    [Tags]    api
    ...       supplier_users_api
    ...       delete_access
    ...       delete_access_not_found

    #Instanciando massa de dados
    ${not_found}    Factory Supplier Users Api    not_found

    # Definindo payload
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
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]/accesses/1234
    ...           ${headers}                                                                              
    ...           ${empty}                                                                                
    ...           404

    # Validando response header
    Should be equal as strings    ${response.reason}    ${not_found}[reason]

    # Deletando supplier
    DELETE API    ${supplier_users_api}/${create_supplier_payload}[identityServerUserId]
    ...           ${headers}                                                                
    ...           ${empty}                                                                  
    ...           200
