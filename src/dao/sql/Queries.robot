*Setting
Documentation    Queries SQL

Resource    ${EXECDIR}/src/Env.robot

*Keywords
Atualizar usuários MEWeb
    # Definindo lista de usuários editados
    @{usuarios}    Create List
    ...            'RENATOSOUZAFAST'
    ...            'MAXEL22'
    ...            'FDC371AB'
    ...            'B55BDBC2'

    FOR    ${usuario}    IN    @{usuarios}

        # Definindo query
    ${query}    Set Variable    UPDATE Usuarios SET SenhaExpirada = 0, Tentativas = 0, Status = 1, Senha = '31fc6e6d925a5cd43a0b8c314c63c14d4f93236eaa99a9f1f265c8fc6d26ba7c', tiposenhahash = 1 WHERE LoginName = ${usuario}

        # Executando query
    POST SQL    ${query}

    END

Atualizar política RFQ
    @{usuarios}    Create List
    ...            'MAXEL22'
    ...            'FDC371AB'

    FOR    ${usuario}    IN    @{usuarios}

        # Definindo query
    ${query}    Set Variable    UPDATE Usuarios SET PoliticaRfq = 26 WHERE LoginName = '${usuario}'

        # Executando query
    POST SQL    ${query}

    END

Excluir segmentos e abrangência
    @{cnpjs}    Create List
    ...         '04432208000130'
    ...         '96404942000104'
    ...         '41723886000189'
    ...         '02559428000102'

    FOR    ${cnpj}    IN    @{cnpjs}

        # Definindo query
    ${query}    Set Variable    SELECT * FROM SegmentoFornecedor WHERE FornecedorCnpj = ${cnpj} IF (SELECT @@ROWCOUNT) <> 0 BEGIN DELETE FROM SegmentoFornecedor WHERE FornecedorCNPJ = ${cnpj} END UPDATE Usuarios set AbrangenciaID = NULL WHERE CGC = ${cnpj}    

        # Executando query
    POST SQL    ${query}

    END

Incluir segmentos e abrangência
    @{cnpjs}    Create List
    ...         '96404942000104'
    ...         '41723886000189'
    ...         '02559428000102'

    FOR    ${cnpj}    IN    @{cnpjs}

    # Definindo query
    ${query}    Set Variable    SELECT * FROM SegmentoFornecedor WHERE SegmentoID = '27000000' AND FornecedorCnpj = ${cnpj} IF (SELECT @@ROWCOUNT) = 0 BEGIN INSERT INTO SegmentoFornecedor ([SegmentoId], [FornecedorCnpj]) VALUES ('27000000', ${cnpj}) END UPDATE Usuarios set AbrangenciaID = 1 WHERE CGC = ${cnpj}

    # Executando query
    POST SQL    ${query}

    END