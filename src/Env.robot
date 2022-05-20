*Settings
Documentation    Configurações de Ambiente

# Bibliotecas
Library    Browser
Library    Collections
Library    RequestsLibrary
Library    String

# Disponibilizando recursos
Library    ${EXECDIR}/resources/Utils.py
Library    ${EXECDIR}/src/config/factories/SetupApi.py
Library    ${EXECDIR}/src/config/factories/SetupMeWeb.py
Library    ${EXECDIR}/src/config/factories/SetupSql.py
Library    ${EXECDIR}/src/dao/api/Apis.py
Library    ${EXECDIR}/src/pages/MeWeb.py

Resource    ${EXECDIR}/src/Actions.robot
Resource    ${EXECDIR}/src/dao/api/Delete.robot
Resource    ${EXECDIR}/src/dao/api/Get.robot
Resource    ${EXECDIR}/src/dao/api/Post.robot
Resource    ${EXECDIR}/src/dao/api/Put.robot
Resource    ${EXECDIR}/src/dao/sql/Post.robot
Resource    ${EXECDIR}/src/dao/sql/Queries.robot
Resource    ${EXECDIR}/src/config/SetupApi.robot
Resource    ${EXECDIR}/src/config/SetupE2e.robot
Resource    ${EXECDIR}/tests/e2e/base/Login.robot
Resource    ${EXECDIR}/tests/e2e/base/buyer/Cotacao.robot
Resource    ${EXECDIR}/tests/e2e/base/supplier/Cotacao.robot
Resource    ${EXECDIR}/tests/e2e/base/supplier/OutrasInformacoes.robot
Resource    ${EXECDIR}/tests/e2e/base/supplier/SegmentosAbrangencia.robot

# Disponibilizando massas de dados

Library    ${EXECDIR}/resources/factories/api/CompanyApi.py
Library    ${EXECDIR}/resources/factories/api/SegmentApi.py
Library    ${EXECDIR}/resources/factories/api/SupplierUsersApi.py
Library    ${EXECDIR}/resources/factories/e2e/Cotacao.py
Library    ${EXECDIR}/resources/factories/e2e/CotacaoPublica.py
Library    ${EXECDIR}/resources/factories/e2e/SegmentosAbrangencia.py