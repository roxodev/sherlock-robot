*Setting
Documentation    POST SQL

# Disponibilizando recursos
Resource    ${EXECDIR}/src/Env.robot

*Keywords
POST SQL
    [Arguments]    ${query}

    ${auth}    Create List
    ...        ka0ieTiiSheey4o
    ...        A0LoTdGQ9HPjLQd

    ${headers}    Create Dictionary
    ...           Content-Type=text/plain
    ...           Cache-Control=no-cache

    # Enviar query via requisição POST
    Create Session    sql                   
    ...               ${sql}[endpoint] 
    ...               auth=${auth}
    ...               headers=${headers}    

    ${response}    POST On Session
    ...            sql                               
    ...            ${sql}[endpoint]
    ...            data=${sql}[database] ${query}

    Status Should Be    200    ${response}