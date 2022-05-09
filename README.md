# Sherlock Robot

Robô para automação de testes de regressão baseado em **BDD/ATDD**, visando assegurar maior qualidade e confiabilidade nos desenvolvimentos da **Squad Marketplace Fornecedores.**

![Badge](https://img.shields.io/badge/robot%20framework-4.1.3-blue)
![Badge](https://img.shields.io/badge/python-3.10.2-blue)

## Índice

   - [Status](#📊-status)
   - [Features](#🧪-features)
   - [Preparação](#🚀-preparação)
   - [Execução](#⚙️-execução)
   - [Tecnologias](#🛠️-tecnologias)
   - [Autores](#✒️-autores)

## 📊 Status

- Em desenvolvimento.

## 🧪 Features

### E2E

#### Cotação Pública
 - [x] Exibir resposta pública no mapa comparativo automaticamente
 - [x] Ocultar resposta pública do mapa comparativo
 - [ ] Ordenar oportunidades de negócios

#### Segmentos e Abrangência
 - [ ] Adicionar segmento sem abrangência no primeiro acesso
 - [ ] Adicionar abrangência sem segmento no primeiro acesso
 - [x] Adicionar segmento e abrangência no primeiro acesso
 - [x] Adicionar segmento pai já existente
 - [x] Adicionar segmento pai não existente
 - [x] Adicionar segmento filho de um segmento pai já existente
 - [x] Adicionar segmento filho de um segmento pai não existente
 - [x] Exluir segmento
 - [x] Excluir todos os segmentos
 - [x] Atualizar abrangência

#### Cadastro de usuário Keycloak
 - [ ] Cadastro de usuário Keycloack
 - [ ] Cadastro de usuário Keycloack incompleto
 - [ ] Cadastro de usuário Keycloack inválido

#### Login de usuário Keycloack
 - [ ] Login de usuário Keycloack
 - [ ] Login de usuário Keycloack incompleto
 - [ ] Login de usuário Keycloack incorreto
 - [ ] Login de usuário Keycloack inválido

#### Configuração de usuário Keycloack

 - [ ] Associação de usuário ME Web ao usuário Keycloack
 - [ ] Substituição de usuário ME Web ativo no usuário Keycloack

### API

#### MEWEB API - RFQ Supplier
 - [ ] Order by default
 - [ ] Order by most recent
 - [ ] Order by close to expiration

#### MEWEB API - Suppliers V1
 - [ ] Update supplier info
 - [ ] Update supplier segments

#### MEWEB API - Suppliers V2
 - [ ] Update supplier info
 - [ ] Update supplier segments

#### Segments API
 - [x] Get a segment by id
 - [x] Get segments by filter
 - [x] Search by segments with filter

#### Company API
 - [ ] Create a company
 - [ ] Get a company by document
 - [ ] Get a company by id
 - [ ] Update a company
 - [ ] Delete a company

## 🚀 Preparação

### Instalação

- Instalar [node.js 14.18.0](https://nodejs.org/download/release/v14.18.0)
  
- Instalar [python 3.7.0](https://www.python.org/) ou superior em C:\ selecionando a opção **✅ Add Python to PATH**
  
- Instalar dependências do projeto
  
  `pip install -r requirements.txt`

### Inicialização

- Inicializar Browser Library
  
  `rfbrowser init`

## ⚙️ Execução

- Execução local
  
  `robot -d ./logs -i tag -v env:ambiente -v headless:true ou false tests/`

- Execução CI Jenkis
  
  [Pipeline Jenkins](https://jenkins.qa.miisy.me/job/Squad-MarketPlace/job/TRUNK/job/sherlock-robot/)

## 🛠️ Tecnologias

- [Python](https://www.python.org/)
- [Node.js](https://nodejs.org/download/release/v14.18.0)
- [Robot Framework](https://robotframework.org/)

## ✒️ Autores

⌨️ com ❤️ por Lucas Roxo

[![Linkedin Badge](https://img.shields.io/badge/-lucasroxo-blue?style=flat-square&logo=Linkedin&logoColor=white&link)](https://www.linkedin.com/in/lucasroxo/)