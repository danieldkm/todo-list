# flutter_todo_list


## Arquitetura do projeto
- MVVM
  View -> ViewModel -> Module

Page (view) tem um controller (ViewModel) e ela se comunica com as Services que se comunica com as repositories.

core: tudo que é comum dentro da aplicação.
exception: exceções do app
models: traz os modelos do "mundo real", modelos do app
modules: features do app
services: camada de regra de negocio (controller faz o controle da regra de negocio da tela)
repositories: camada de dados. db, api, firebase, etc.

## O que estamos usando neste projeto
- Provider
- Sqflite
- path
- google_fonts
- flutter_signin_button
- fluttericon
- firebase_auth
  - google_sign_in
- validatorless
- flutter_overlay_loader
- clean architecture flutter
- fluttericon
- date_picker_timeline : widget para exibir o calendario
- intl : formataçãp de datas
- flutter_localizations : suporte a "linguas"" 

### icones
pacote fluttericon, recomendar não utilizar o pacote pois é muito pesado.
https://pub.dev/packages/fluttericon
recomendado acessar o link https://www.fluttericon.com/ e baixar os icones desejados.


### register page
app bar customizado , icone de voltar.


### FittedBox widget do flutter
os filhos desse widget são automaticamente redimensionados.


### Firebase auth

- criar novo projeto no console do firebase 
- em configurações do projeto, criar novo aplicativo para android e ios
  - no android
    - copiar o package name que fica no arquivo AndroidManifest ex=> com.example.flutter_todo_list"
    - adicionar "Impressão Digital", seguir os passo a passo clicando no link.

## Desafio
*a partir do commit "Resolvendo problema de layout no header"

[ ] ao fazer logout limpar os dados daquele login
[ ] opção de deletar uma task (Dismissable, Slider, etc)
[ ] o contador do card principal, exibir a quantidade de tasks que ainda não foram finalizadas