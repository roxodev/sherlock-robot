*Setting
Documentation    Requests API

Resource    ${EXECDIR}/src/Env.robot

*Keywords
Configurar acessos Keycloak
    # Capturar access token keycloack
    Capturar access token keycloak

    # Definindo lista de acessos vinculados
    ${acessos}    Request Vincular Acessos    

    POST API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f/accesses/bulk-action
    ...         ${headers}                                                                         
    ...         ${acessos}
    ...         200

    # Definindo lista de acessos desvinculados
    ${acessos}    Create List
    ...           3419201
    ...           3643278
    ...           1560882

    DELETE API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f/accesses/bulk-action
    ...           ${headers}                                                                         
    ...           ${acessos}
    ...           200

    # Definindo acesso corrente
    ${acesso}    Create Dictionary
    ...          meWebUserId=2729
    ...          login=VEDANTESLIDER

    POST API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f/set-current-user
    ...         ${headers}                                                                     
    ...         ${acesso}
    ...         200

Excluir usuário Keycloak
    # Capturar access token keycloack
    Capturar access token keycloak

    DELETE API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f
    ...           ${headers}                                                    
    ...           ${empty}
    ...           200


