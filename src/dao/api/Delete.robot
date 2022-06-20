*Setting
Documentation    DELETE API

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
DELETE API
    [Arguments]    ${endpoint}
    ...            ${headers}
    ...            ${payload}
    ...            ${response_code}

    ${response}    DELETE
    ...            ${endpoint}
    ...            headers=${headers}
    ...            json=${payload}
    ...            expected_status=${response_code}

    Set Global Variable    ${response}