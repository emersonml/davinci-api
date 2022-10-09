#  rails -T dev # rails g task dev setup
#  DISABLE_SPRING=1
#  spring stop     IMPORTANT!!!
namespace :dev do
  desc "Configura as migrations "
  task migrations: :environment do
    
    puts "Atualiza os DIR: MODEL e SERIALIZERS e ROUTER (Os controller in API nao sao afetados) "
    puts ">>> spring storp "; %x( spring stop);  puts "end    spring storp "
    puts ">>> ATUALIZANDO Migrates "
    %x(
      rails g scaffold patrimonio name tag:integer
      rails g scaffold compartimento name patrimonio:references
      rails g scaffold kindbtn name 
      rails g scaffold kinddev name 
      rails g scaffold circuit sttus:integer name description compartimento:references kindbtn:references kinddev:references 
    )
    # rails g scaffold patrimonio name
    # rails g scaffold compartimento name patrimonio:references
    # rails g scaffold central sttus:integer name tipo
    # rails g scaffold pino sttus:integer name tipo pinmode
    # rails g scaffold rele sttus:integer name
    # rails g scaffold circuit sttus:integer name central:references pino:references rele:references dev:references btn:references compartimento:references
puts "end    Migrates ATUALIZANDA. "
end   

######################################################################################################


desc "Configura o ambiente de desenvolvimento"
task setup: :environment do
  
  puts ">>> RESETANDO O DB"    
    %x(rails db:drop db:create db:migrate)

  puts ">>> Cadastrando o Patrimonio" ### PATRIMONIO
  Patrimonio.create!(
    name: "5GBrasil",
    tag: 0
  )
  puts "end    Patrimonio cadastrado"
  puts ">>> Cadastrando o Compartimento" ### COMPARTIMENTO
  nomecompartimentos = %w(Recepção CPD)
  nomecompartimentos.each do |nomecompartimento|
    Compartimento.create!(
      name: nomecompartimento,
      patrimonio: Patrimonio.first
    )
  end   
  puts "end    Compartimento cadastrado"
  puts ">>> Cadastrando os Kindbtn "    ### KIND BTN
  nameKindBtns = %w( time toggle toggle toggle pulso toggle toggle )
  nameKindBtns.each do |namekindbtn|
    Kindbtn.create!(
      name: namekindbtn
    )
  end   
  puts "end    Kindbtn cadastrados"
  puts ">>> Cadastrando os Kinddev "    ### KIND DEV
  nameKinddevs = %w(fechadura-close lampada lampada lampada portao lampada sirene )
  nameKinddevs.each do |namekinddev|
    Kinddev.create!(
      name: namekinddev
    )
  end   
  puts "end    Kindbtn cadastrados"

  puts ">>> Cadastrando Circuit "  ### CIRCUITO
  # nameKindBtns.each do |namekindbtn|
  7.times do |i|
    s = i+1
    # puts nameKinddevs[2];
    Circuit.create!(
      sttus: 0,
      name: "Circuito#{s}",
      description: "1 fechadura para porta de vidro da recepcao", 
      kindbtn: Kindbtn.find(s), 
      kinddev: Kinddev.find(s)
      # kinddev: Kinddev.first
      # kinddev: Kinddev.kinddev_id: (1)
      # i+1
    )
  end # times 

    puts "end    Circuit cadastrado"
    puts "end    DB RESETADO."

    %x( chmod o+w -R ../davinci-api/ )
    puts ">>> Aplicado permissao de escrita"
    
  end   #populando
end   #dev



# EXEMPLO
#   Hero.create name: "Hero #{i}"


