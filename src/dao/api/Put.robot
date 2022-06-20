*Setting
Documentation    PUT API

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
PUT API
    [Arguments]    ${endpoint}
    ...            ${headers}          
    ...            ${payload}
    ...            ${response_code}

    ${response}    PUT
    ...            ${endpoint}
    ...            headers=${headers}
    ...            json=${payload}
    ...            expected_status=${response_code}

    Set Global Variable    ${response}