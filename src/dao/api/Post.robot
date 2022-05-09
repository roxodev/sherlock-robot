*Setting
Documentation    POST API

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
POST API
    [Arguments]    ${endpoint}
    ...            ${headers}          
    ...            ${payload}
    ...            ${response_code}

    ${response}    POST
    ...            ${endpoint}
    ...            headers=${headers}
    ...            json=${payload}
    ...            expected_status=${response_code}

    Set Test Variable    ${response}