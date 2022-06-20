*Settings
Documentation    Login API

*Keywords
Capturar access token meweb
    POST API    ${accounts_api}/signin
    ...         ${empty}
    ...         ${payload_signin}
    ...         200

    # recuperando token de acesso
    ${access_token}    Set Variable    ${response.json()}[accessToken]

    # Disponiblizando token de acesso
    Set Global Variable    ${access_token}

    # Definindo headers
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Disponiblizando header
    Set Global Variable    ${headers}

Capturar access token keycloak
    POST API    ${identity_api}/auth
    ...         ${empty}
    ...         ${payload_auth}
    ...         200

    # Recuperando token de acesso
    ${access_token}    Set Variable    ${response.json()}[access_token]

    # Disponiblizando token de acesso
    Set Global Variable    ${access_token}

    # Definindo headers
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    # Disponiblizando header
    Set Global Variable    ${headers}