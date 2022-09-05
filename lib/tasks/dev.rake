#  rails -T dev # rails g task dev setup
#  DISABLE_SPRING=1
namespace :dev do
  desc "Configura as migrations "
  task migrations: :environment do
    
    puts ">>> ATUALIZANDO Migrates ..."
    %x(
      rails g scaffold kindbtn name 
      rails g scaffold btn sttus:integer name kindbtn:references
      rails g scaffold dev sttus:integer name tipo
      rails g scaffold circuit sttus:integer name btn:references dev:references 
    )
    # rails g scaffold patrimonio name
    # rails g scaffold compartimento name patrimonio:references
    # rails g scaffold central sttus:integer name tipo
    # rails g scaffold pino sttus:integer name tipo pinmode
    # rails g scaffold rele sttus:integer name
    # rails g scaffold circuit sttus:integer name central:references pino:references rele:references dev:references btn:references compartimento:references
puts "... Migrates ATUALIZANDA. "
end

######################################################################################################


desc "Configura o ambiente de desenvolvimento"
task populando: :environment do
  
  puts ">>> RESETANDO O DB ..."    
    %x(rails db:drop db:create db:migrate)
    
    
    puts ">>> Cadastrando os Kind_btn ..."    ### BOTOES
    nameKindBtns = %w(retencao pulso time)
    nameKindBtns.each do |namekindbtn|
      Kindbtn.create!(
        name: namekindbtn
      )
    end
    puts "... Kind_btn cadastrados"
    puts ">>> Cadastrando Btn ..."
      Btn.create!(
        sttus: 0,
        name: "botao demo",
        kindbtn: Kindbtn.first
      )
      puts "... Btn cadastrado"

      puts ">>> Cadastrando o Dev ..." ### DISPOSITIVOS
      Dev.create!(
        sttus: 0,
        name: "lampada demo",
        tipo: "lampada"
      # kind: Kind.all.sample
    )
    puts "... Dev cadastrado"
    
    puts ">>> Cadastrando Circuit ..."  ### CIRCUITO
    Circuit.create!(
      sttus: 0,
      name: "Circuito1",
      btn: Btn.first,
      dev: Dev.first
    )
    puts "... Circuit cadastrado"
    
    
    
    
    puts "... DB RESETADO. "
  end

end
