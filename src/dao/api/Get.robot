*Setting
Documentation    GET API

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
GET API
    [Arguments]    ${endpoint}
    ...            ${headers}
    ...            ${response_code}

    ${response}    GET
    ...            ${endpoint}
    ...            headers=${headers}
    ...            expected_status=${response_code}

    Set Test Variable    ${response}