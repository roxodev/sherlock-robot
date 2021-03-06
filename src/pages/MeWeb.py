def factory_po_meweb(target):

    data = {

        'trunk': {

            # card perfil
            'card_perfil': {

                # botões
                'btn_abrir_card_perfil': 'css=div[class=avatar] span[class=b-avatar-badge]',
                'btn_fechar_card_perfil': 'css=div[class=profile-content] span[class=b-avatar-badge]',
                'btn_meus_acessos': 'css=i[class="me-icon-l icon-cog"]',
                'btn_lista_alterar_acesso': 'css=i[class="me-icon-l icon-exchange"]',
                'btn_alterar_acesso': 'css=div[class=user-login]:first-child button',

                # campos
                'campo_nome_usuario': 'css=div[class="user-name"]',

                # links
                'link_lista_idiomas': 'css=div[class=me-accordion-list] > a',
                'link_pt_br': ' css=div[class="me-accordion-list opened"] ul li:nth-child(1) a'
            },

            # página /comparative-panel
            'comparative_panel': {
                'url': 'https://trunk.me.com.br/comparative-panel',
                # tabelas
                'tbl_mapa_comparativo': 'css=table[class="main-table"]'
            },

            # compomentes comuns
            'comum': {
                # labels
                'label_codigo_me': 'css=p[class="badge-code "]',

                # tabelas
                'tbl_grid_me': 'css=div[class*=table-responsive]',
                'linha_grid_me': 'css = div[class*=table-responsive] tbody tr[aria-rowindex = "1"]',

                # toasters
                'toaster_sucesso': 'css=p[class=message-success]',

                # botões
                'btn_salvar_avancar': 'css=button[class*=submitBtn]',

                # campos
                'campo_titulo': 'css=span[class=headerTituloPaginaME_text]',

                # loadings
                'load_barra_progresso': 'css=div[class=progress]'

            },

            # página /CotacaoNova.asp
            'cotacao_nova_asp': {
                'url': 'https://trunk.me.com.br/CotacaoNova.asp',
                # botões
                'btn_avancar': 'id=MEComponentManager_MEButton_3',
                'btn_finalizar': 'id=btnFinalizar2',

                # inputs
                'input_descricao': 'id=Descr',
                'input_quantidade': 'id=Quant',
                'input_unidade': 'id=Unida',
                'input_aplicacao': 'id=Aplic',
                'input_fabricante': 'id=Fabri',
                'input_codigo': 'id=Codigo',
                'input_complemento': 'id=Compl',
                'input_titulo': 'css=input[name=Resumo]',
                'input_data_limite': 'id=DataLimite',
                'input_cat_cotacao': 'id=CategoriaCotacao',
            },

            # página /Default.asp
            'default_asp': {
                'url': 'https://trunk.me.com.br/Default.asp',

                # inputs
                'input_login': 'css=iframe >>> id=login-2',
                'input_senha': 'css=iframe >>> id=password',

                # botões
                'btn_login': 'css=iframe >>> input[value=Login]'
            },

            # header ME
            'header': {
                # cards
                'card_perfil': 'css=div[class="profile-card"]',

                # botões
                'btn_novo': 'css=button[class="btn me-button truncate btn-primary btn-md"]',
                'btn_busca': 'css=div[class=sub-header] div[class=term] i',

                # inputs
                'input_busca': 'css=div[class=sub-header] input[class*="form-control form-control"]',

                # links
                'link_cotacao': 'css=li > a >> text=Cotação',
                'link_contrato': 'css=li > a >> text=contrato'
            },

            # página /home/transactions
            'home_transactions': {
                'url': 'https://trunk.me.com.br/home/transactions',

                # modais
                'modal_show_cotacao': 'css=iframe[class=document-modal__content__frame]',

                # menus
                'menu_pendencias_compra': 'css=div >> text=Pendências de Compra',
                'menu_pendencias_aprovacao': 'css=div >> text=Pendências de Aprovação',
                'menu_requisicoes': 'css=div[class="me-accordion-list left"] a >> text=Requisições',
                'menu_cotacoes': 'css=div[class="me-accordion-list left"] a >> text=Cotações',
                'menu_contratos': 'css=div[class="me-accordion-list left"] a >> text=Contratos',
                'menu_pedidos': 'css=div[class="me-accordion-list left"] a >> text=Pedidos',
                'menu_nota_fiscal': 'css=div[class="me-accordion-list left"] a >> text=Nota Fiscal',
            },

            # página /MeuMercadoVendas
            'mercado_compras': {
                'url': 'https://trunk.me.com.br/MeuMercadoCompras.asp',

                # banners
                'banner_experiencia': 'id=banner-experiencia',

                # botões
                'btn_habilita_nova_home': '#chkHabilitaHome'
            },

            # página /MapaComparativoDefault.asp
            'modal_mapa_comparativo_default': {
                'tbl_mapa_comparativo': 'css=iframe >>> table[class=tabelaMC]'
            },

            # modal página /RespCotaItem
            'modal_resp_cota_item': {
                # banners
                'banner_resp_cot': 'css=iframe >>> div[id=banner-message] p',

                # botões
                'btn_responder': 'css=iframe >>> id=MEComponentManager_MEButton_5',
                'btn_continuar': 'css=iframe >>> id=continue_button',

                # campos
                'campo_titulo': 'css= iframe >>> span[class=headerTituloPaginaME_text]',

                # inputs
                'input_frete': 'css=iframe >>> id=Frete',
                'input_condicao_pagamento': 'css=iframe >>> select[name=CondicaoPagamento]',
                'input_tipo_frete': 'css=iframe >>> select[name=IcoTerms]',
                'input_nome_contato': 'css=iframe >>> input[name=NomeContato]',
                'input_obs_cabecalho': 'css=iframe >>> id=ObsForn',
                'input_tel_contato': 'css=iframe >>> input[name=NumFoneCota]',
                'input_moeda': 'css=iframe >>> id=MoedaCot',
                'input_taxa_conversao': 'css=iframe >>> id=ConversaoFornecedor',
                'input_preco_unitario': 'css=iframe >>> id=Preco',
                'input_unidade': 'css=iframe >>> id=UnidadeResp',
                'input_ipi': 'css=iframe >>> id=TipoImposto',
                'input_ipi_aliquota': 'css=iframe >>> id=IPI',
                'input_ipi_incluso': 'css=iframe >>> id=IPIIncluso',
                'input_icms_aliquota': 'css=iframe >>> id=ICMS',
                'input_icms_incluso': 'css=iframe >>> id=ICMSIncluso',
                'input_prazo_entrega': 'css=iframe >>> id=Prazo',
                'input_fabricante': 'css=iframe >>> id=fabricante',
                'input_obs_item': 'css=iframe >>> input[name=Observacao',
                'input_subs_tribut': 'css=iframe >>> select[name=SubstituicaoTributaria',
                'input_subs_tribut_aliquota': 'css=iframe >>> id=AliquotaSubstituicaoTributaria',
                'input_pis_aliquota': 'css=iframe >>> id=PIS',
                'input_pis_incluso': 'css=iframe >>> select[name=PISIncluso',
                'input_cofins_aliquota': 'css=iframe >>> id=COFINS',
                'input_cofins_incluso': 'css=iframe >>> select[name=COFINSIncluso',
                'input_valor_subs_tribut': 'css=iframe >>> id=ValorSubstituicaoTributaria',
                'input_base_calculo_icms': 'css=iframe >>> id=BaseCalculo',
            },

            # modal novidades segmentos
            'modal_novidades_segmentos': {
                # checkbox
                'check_nao_mostar_novamente': 'div[class=modal-segments-page-checkbox] input',
            },

            # modal página /showcotacao
            'modal_show_cotacao': {
                # botões
                'btn_novo_mapa_comparativo': 'css=iframe >>> button >> text=Novo Mapa Comparativo',
                'btn_mapa_comparativo_default': 'css=iframe >>> button >> text=Ver Mapa Comparativo',
                'btn_ocultar_forn': 'css=iframe >>> id=slasheye',
                'btn_exibir_forn': 'css=iframe >>> id=eye',

                # tabelas
                'tbl_resposta_cotacao': 'css=iframe >>> tbody[id=tTlShowCotacaoBody]',

            },

            # página /MudaSenha.asp
            'muda_senha_asp': {
                'url': 'https://trunk.me.com.br/MudaSenha.asp',

                # inputs
                'input_senha_antiga': 'css=input[name=SenhaOld] ',
                'input_senha_nova': 'css=input[name=SenhaNew]',
                'input_confirma_senha_nova': 'css=input[name=SenhaNew2]'
            },

            'supplier_info': {
                'url': 'https://trunk.me.com.br/supplier/register/info',

                # inputs
                'input_porte': 'css=div[class=vs__dropdown-toggle] i',

                # campos
                'campo_porte': 'css=div[class=vs__dropdown-toggle]',

                # listas
                'lista_opcao_porte': 'css=li b',

            },

            'supplier_register': {
                'url': 'https://trunk.me.com.br/supplier/register'
            },

            'supplier_segments': {
                # inputs
                'input_abrangencia': 'css=div[class=vs__dropdown-toggle] i',

                # listas
                'lista_opcao_abrangencia': 'css=li span',
                'lista_segmentos': 'css=ul[class=selected-segments]',

                # botões
                'btn_excluir_segmento': 'css=li:nth-child(1) i[class="me-icon-s icon-trash"]',
                'btn_excluir_abrangencia': 'css=span[class="me-icon-l icon-times deselect-button"]',

                # campos
                'campo_abrangencia': 'div[class=vs__dropdown-toggle]',
                'campo_alerta_segmento_abrangencia': 'css=div[class="alert alert-dismissible alert-warning"]',

                # modais
                'modal_excluir_segmento': 'css=div[class=modal-confirm-refuse]'

            },

            # página /supplier/register/segments/add
            'supplier_segments_add': {
                'url': 'https://trunk.me.com.br/supplier/register/segments/add',
                # campos
                'campo_resultado_busca': 'css=div[class=search-result] input',

                # inputs
                'input_busca_segmentos': 'css=input[class="form-control form-control-lg"]',
                'input_check_segmento': 'div[class=search-result] input'
            },

            # página /supplier/search/
            'supplier_search': {
                'url': 'https://trunk.me.com.br/supplier/search',
                # inputs
                'input_check_fornecedor': 'td div >label[class=custom-control-label]'
            },

            # página /supplier/inbox/
            'supplier_inbox': {
                'url': 'https://trunk.me.com.br/supplier/inbox',
                # modais
                'modal_billing': 'css=div[class="modal-dialog modal-lg"]',
                'modal_resp_cota_item': 'css=iframe[class=frame-in-modal]',
                'modal_novidades_segmentos': 'css=div[class=modal-content]',

                # botões
                'btn_ordenacao': 'css=button[class="btn dropdown-toggle btn-outline-primary btn-sm"]',

                # listas
                'lista_ordenacao': 'css=ul[class="dropdown-menu show"] li a span'
            },

            # página /do/SupplierSSO.mvc/auth
            'supplier_sso_auth': {
                # inputs
                'input_email': 'id=username',
                'input_senha': 'id=password',

                # botões
                'btn_login': 'id=kc-login'
            },

            # página /supplier/user/
            'supplier_user': {
                # campos
                'campo_titulo': 'css=div[class=page-title] >> text=Meus Acessos',

                # tabelas
                'tbl_acessos_vinculados': 'css=div[class="tab-pane me-tabs-item active"]:first-child',
                'tbl_acessos_desvinculados': 'css=div[class="tab-pane me-tabs-item active"]:last-child',

                # toaster
                'toaster_acessos': 'css=div[class=toast-body] span',
            },

            # página /supplier/user/firstAccess
            'supplier_user_first_access': {
                # campos
                'campo_titulo_controle_de_acesso': 'css=h1[class=title] >> text=Empresas e Controle de acesso'
            },

            # página /supplier/user/firstAccess/relation
            'supplier_user_first_access_relation': {
                # inputs
                'input_seleciona_todos_acessos': 'css=input[class=custom-control-input][value=true]',

                # campos
                'campo_alerta_sem_acessos': 'css=div[class="my-2 text-center"]',

                # links
                'link_sair': 'div[class="button-bar"] a >> text=Sair'
            },

            # página /timezone.mvc
            'timezone_mvc': {
                # modais
                'modal_timezone': 'id=TimezonePopup',

                # botões
                'btn_aceitar': 'css=iframe >>> id=btnAcceptTimeZone',

            },
        },

    }

    return data[target]
