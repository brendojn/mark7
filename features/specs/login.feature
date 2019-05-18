#language: pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tarefas
    Sendo um usuário cadastrado
    Posso logar no sistema

    # email e senha
    # DDT => Data Driven Testing

    Contexto: Formulário
        Dado que eu acessei o formulário de login
    
    @login @logout
    Cenario: Login do usuário

        Quando faço login com "brendo@bol.com" e "123456"
        Então sou autenticado com sucesso
        E sou redirecionado para o painel de tarefas com a mensagem "Hello, Brendo Oliveira"
    
    Esquema do Cenário: Tentativa de logar

        Quando faço login com "<email>" e "<senha>"
        Então devo ver a mensagem de alerta "<saida>"

        Exemplos: 
        | email                     | senha   | saida                       |
        | eu@papito.io              | xpto123 | Incorrect password          |
        | padre.kevedo@noekzite.org | xpto123 | User not found              |
        | fernando&qaninja.io       | xpto123 | Email is required           |
        |                           | xpto123 | Email is required           |
        | eu@papito.io              |         | Password is required        |