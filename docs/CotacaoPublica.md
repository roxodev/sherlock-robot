# Cotação Pública

## Funcionalidade: Resposta pública de cotação

**Eu** como comprador

**Quero** que a resposta de cotação pública seja demonstrada automaticamente no Mapa Comparativo

**Para** que eu possa comparar com as demais respostas dos fornecedores e poder fechar pedido com o fornecedor origem de cotação pública.

### Cenário: Exibir resposta pública no mapa comparativo automaticamente

    Dado que uma cotação pública esteja criada no portal
    Quando respondida por um fornecedor existente na base do comprador e não incluído na cotação
    Então a resposta deve ser incluída automaticamente no mapa comparativo
    
### Cenário: Ocultar resposta pública do mapa comparativo

    Dado que haja uma resposta pública de fornecedor existente na base do comprador não incluído na cotação
    Quando validar a mensagem de tooltip:
                                        "Resposta pública já incluída no Mapa Comparativo, pois fornecedor consta na base de Meus Fornecedores. Clique para ocultar a resposta."
    E ocultar a resposta do fornecedor no mapa comparativo
    Então a resposta NÃO deve ser incluída automaticamente no mapa comparativo