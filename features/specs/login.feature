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
        E sou redirecionado para o painel de tarefas com a mensagem "Olá, Brendo Oliveira"

    @login
    Esquema do Cenário: Tentativa de logar

        Quando faço login com "<email>" e "<senha>"
        Então devo ver a mensagem de alerta "<saida>"

        Exemplos: 
        | email                     | senha   | saida                       |
        | eu@papito.io              | xpto123 | Senha inválida.             |
        | padre.kevedo@noekzite.org | xpto123 | Usuário não cadastrado.     |
        | fernando&qaninja.io       | xpto123 | Email incorreto ou ausente. |
        |                           | xpto123 | Email incorreto ou ausente. |
        | eu@papito.io              |         | Senha ausente. |