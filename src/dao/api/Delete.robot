*Setting
Documentation    DELETE API

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
DELETE API
    [Arguments]    ${endpoint}
    ...            ${headers}
    ...            ${response_code}

    ${response}    DELETE
    ...            ${endpoint}
    ...            headers=${headers}
    ...            expected_status=${response_code}

    Set Test Variable    ${response}