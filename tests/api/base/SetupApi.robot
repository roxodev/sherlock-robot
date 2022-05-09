*Settings
Documentation    Setup API

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
Configurar ambiente API
    # Definindo configurações de APIs
    ${APIS}         Factory APIs         ${env}
    ${SETUP_API}    Factory Setup API    ${env}

    # Instanciando APIs
    ${accounts_api}=          Set Variable    ${APIS}[accounts_api]
    ${company_api}=           Set Variable    ${APIS}[company_api]
    ${identity_api}=          Set Variable    ${APIS}[identity_api]
    ${segment_api}=           Set Variable    ${APIS}[segment_api]
    ${supplier_users_api}=    Set Variable    ${APIS}[supplier_users_api]

    # Instanciando payloads para captura de access token
    ${payload_signin}=    Set Variable    ${SETUP_API}[payload_signin]
    ${payload_auth}=      Set Variable    ${SETUP_API}[payload_auth]

    # Disponibilizando APIs
    Set Global Variable    ${accounts_api}
    Set Global Variable    ${company_api}
    Set Global Variable    ${identity_api}
    Set Global Variable    ${segment_api}
    Set Global Variable    ${supplier_users_api}

    # Disponibilizando payloads para captura de access token
    Set Global Variable    ${payload_signin}
    Set Global Variable    ${payload_auth}


Capturar access token meweb
    POST API    ${accounts_api}/signin
    ...         ${empty}
    ...         ${payload_signin}
    ...         200

    # recuperando token de acesso
    ${access_token}    Set Variable    ${response.json()}[accessToken]

    # Disponiblizando token de acesso
    Set Test Variable    ${access_token}

Capturar access token keycloak
    POST API    ${identity_api}/auth
    ...         ${empty}
    ...         ${payload_auth}
    ...         200

    # recuperando token de acesso
    ${access_token}    Set Variable    ${response.json()}[access_token]

    # Disponiblizando token de acesso
    Set Test Variable    ${access_token}