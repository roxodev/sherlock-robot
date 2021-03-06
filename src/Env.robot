*Settings
Documentation    Configurações de Ambiente

# Bibliotecas
Library    Browser
Library    Collections
Library    RequestsLibrary
Library    String

# Disponibilizando recursos
Library    ${EXECDIR}/resources/Utils.py
Library    ${EXECDIR}/src/config/factories/Apis.py
Library    ${EXECDIR}/src/config/factories/Config.py
Library    ${EXECDIR}/src/dao/api/factories/Requests.py
Library    ${EXECDIR}/src/pages/MeWeb.py

Resource    ${EXECDIR}/src/Actions.robot
Resource    ${EXECDIR}/src/dao/api/Delete.robot
Resource    ${EXECDIR}/src/dao/api/Get.robot
Resource    ${EXECDIR}/src/dao/api/Post.robot
Resource    ${EXECDIR}/src/dao/api/Put.robot
Resource    ${EXECDIR}/src/dao/api/Requests.robot
Resource    ${EXECDIR}/src/dao/sql/Post.robot
Resource    ${EXECDIR}/src/dao/sql/Queries.robot
Resource    ${EXECDIR}/src/config/Config.robot
Resource    ${EXECDIR}/tests/e2e/base/buyer/Cotacao.robot
Resource    ${EXECDIR}/tests/e2e/base/comum/Login.robot
Resource    ${EXECDIR}/tests/e2e/base/comum/SetupTeardown.robot
Resource    ${EXECDIR}/tests/e2e/base/supplier/Cotacao.robot
Resource    ${EXECDIR}/tests/e2e/base/supplier/MeusAcessos.robot
Resource    ${EXECDIR}/tests/e2e/base/supplier/Segmentos.robot

# Disponibilizando massas de dados
Library    ${EXECDIR}/resources/factories/api/CompanyApi.py
Library    ${EXECDIR}/resources/factories/api/SegmentApi.py
Library    ${EXECDIR}/resources/factories/api/SupplierUsersApi.py
Library    ${EXECDIR}/resources/factories/e2e/AdicionarAbrangencia.py
Library    ${EXECDIR}/resources/factories/e2e/AdicionarSegmentos.py
Library    ${EXECDIR}/resources/factories/e2e/AlterarAcessoCorrente.py
Library    ${EXECDIR}/resources/factories/e2e/CadastroPrimeiroAcesso.py
Library    ${EXECDIR}/resources/factories/e2e/DesvincularAcessos.py
Library    ${EXECDIR}/resources/factories/e2e/ExcluirSegmentos.py
Library    ${EXECDIR}/resources/factories/e2e/ExibirRespostaPublica.py
Library    ${EXECDIR}/resources/factories/e2e/OcultarRespostaPublica.py
Library    ${EXECDIR}/resources/factories/e2e/OrdenarCotacaoPublica.py
Library    ${EXECDIR}/resources/factories/e2e/PrimeiroAcessoKeycloak.py
Library    ${EXECDIR}/resources/factories/e2e/VincularAcessos.py