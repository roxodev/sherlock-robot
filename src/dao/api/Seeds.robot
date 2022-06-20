*Setting
Documentation    Seed Requests API

Resource    ${EXECDIR}/src/Env.robot

*Keywords
Vincular acessos
    # Capturar access token keycloack
    Capturar access token keycloak

    # Definindo lista de acessos vinculados
    ${acessos}    Seed Vincular Acessos    

    POST API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f/accesses/bulk-action
    ...         ${headers}                                                                         
    ...         ${acessos}
    ...         200

Desvincular acessos
    # Capturar access token keycloack
    Capturar access token keycloak

    # Definindo lista de acessos desvinculados
    ${acessos}    Seed Desvincular Acessos

    DELETE API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f/accesses/bulk-action
    ...           ${headers}                                                                                                                                                    
    ...           ${acessos}
    ...           200

Definir usuário corrente
    # Capturar access token keycloack
    Capturar access token keycloak

    # Definindo acesso corrente
    ${acesso}    Create Dictionary
    ...          meWebUserId=2729
    ...          login=VEDANTESLIDER

    POST API    ${supplier_users_api}/d714faaf-af05-4590-86c9-1dbd94a1088f/set-current-user
    ...         ${headers}                                                                     
    ...         ${acesso}
    ...         200