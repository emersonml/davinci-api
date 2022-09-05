# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


* Ruby version
ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]
* COMANDO e CONFIGS UTILIZADOS 
    rails new davinci-api --api
    chmod o+w -R davinci
    estamos no git/dev
* System dependencies

* Configuration
config.file_watcher = ActiveSupport::FileUpdateChecker  // config/environments

* Database creation
comecar pelo model da tem menos dependencia


Column Modifiers => notions

rails db:migrate

rails c => c = Circuit.create!(sttus=false)    ///// testando  
rails c => c = Circuit.new => c.save!    ///// testando  


* Database initialization

* Controllers creation

rails g controller devs
rails g controller btns
rails g controller circuEXts

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


* CONTEUDOS UTEIS

<%= Rails.root.join("tmp/storage") %>
DEFAULT_FILES_PATH = Files.join(Rails.root, 'lib', 'tmp') // aqui o Files sabe se esta ultilizando o windows e inverte as barras


==============================  
https://guiarails.com.br/layouts_and_rendering.html
2 Criando respostas
Do ponto de vista do controller, há três maneiras de criar uma resposta HTTP:

Chamar render para criar uma resposta completa e enviar de volta ao navegador

Chamar redirect_to para enviar um status code HTTP de redirecionamento para o navegador
Chamar head para criar uma resposta que consiste apenas em cabeçalhos HTTP para enviar de volta ao navegador
===================================





rails g scaffold central sttus:integer name tipo
rails g scaffold pino sttus:integer name tipo pinmode
rails g scaffold rele sttus:integer name
rails g scaffold dev sttus:integer name tipo
rails g scaffold btn sttus:integer name tipo
rails g scaffold patrimonio name
rails g scaffold compartimento name patrimonio:references
rails g scaffold circuit sttus:integer central:references pino:references rele:references dev:references btn:references compartimento:references