## Funcionalidade: Cadastro de segmentos de fornecedores

**Eu** como fornecedor

**Quero** cadastrar os meus segmentos de atuação

**Para** receber oportunidades de negócio compatíveis com o meu perfil

### Cenário: Adicionar novo segmento, abrangência e porte via primeiro acesso
    
    Dado que um usuário fornecedor realize o primeiro acesso no Portal ME
    Quando adicionar seus segmentos de atuação, abrangência e porte
    E submeter o formulário de segmentos
    Então os segmentos de atuação, abrangência e porte devem ser atualizados no perfil do usuário

### Cenário: Adicionar novo segmento

    Dado que um usuário fornecedor esteja autenticado no portal ME
    Quando adicionar um novo segmento não adicionado na lista de segmentos
    E submeter o formulário de segmentos
    Então o novo segmento deverá constar na lista de segmentos

### Cenário: Adicionar segmento já adicionado na lista de segmentos

    Dado que um fornecedor esteja autenticado no portal ME
    Quando adicionar um segmento já adicionado na lista de segmentos
    E submeter o formulário de segmentos
    Então a lista de segmentos deverá ser exibida sem alterações

### Cenário: Adicionar novo segmento filho de um segmento já adicionado na lista de segmentos
    Dado que um fornecedor esteja autenticado no portal ME
    Quando adicionar um novo segmento filho de um segmento já adicionado na lista de segmentos
    E submeter o formulário de segmentos
    Então o novo segmento filho deverá ser adicionado na lista de segmentos

### Cenário: Adicionar novo segmento filho de um segmento não adicionado na lista de segmentos

    Dado que um fornecedor esteja autenticado no portal ME
    Quando adicionar um novo segmento filho de um segmento não adicionado na lista de segmentos
    E submeter o formulário de segmentos
    Então o novo segmento filho e seu respectivo segmento pai deverão ser adicionados na lista de segmentos

### Cenário: Salvar lista de segmentos sem adicionar novos segmentos

    Dado que um fornecedor esteja autenticado no portal ME
    Quando submeter o formulário de segmentos sem realizar alterações
    Então a lista de segmentos deverá ser exibida sem alterações

### Cenário: Atualizar abrangência e porte

    Dado que um fornecedor esteja autenticado no portal ME
    Quando atualizar a abrangência e porte
    E submeter o formulário de segmentos
    Então a abrangência e porte devão estar atualizadas
### Cenário: Excluir um segmento da lista de segmentos

    Dado que um fornecedor esteja autenticado no portal ME
    Quando clicar no ícone de lixeira de um segmento correspondente
    E confirmar a exclusão do segmento via modal
    E atualizar a página de segmentos
    Então o segmento excluído não deverá ser exibido na lista de segmentos

### Cenário: Excluir único segmento da lista de segmentos

    Dado que um fornecedor esteja autenticado no portal ME e possua apenas um segmento adicionado na lista de segmentos
    Quando clicar no ícone de lixeira do segmento correspondente
    E confirmar o modal com a mensagem:
                                        "Você precisa ter ao menos 1 segmento selecionado."
    E atualizar a página de segmentos
    Então a lista de segmentos deverá ser exibida sem alterações

