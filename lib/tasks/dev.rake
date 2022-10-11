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
    if Rails.env.development?
      puts ">>>>>>>>>>  ENV  DEVELOPMENT  <<<<<<<<<<"
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
    end
    
    puts ">>>>>>>>>>  ENV  PRODUCTION  <<<<<<<<<<"
    show_spinner("Cadastrando Patrimonio...") { %x(rails dev:add_patrimonio) }
    show_spinner("Cadastrando Compartimento...") { %x(rails dev:add_compartimento) }
    show_spinner("Cadastrando Kindbtn...") { %x(rails dev:add_kindbtn) }
    show_spinner("Cadastrando Kinddev...") { %x(rails dev:add_kinddev) }
    show_spinner("Cadastrando Circuit...") { %x(rails dev:add_circuit) }
    show_spinner("Aplicando permissao de escrita...") { %x( chmod o+w -R ../davinci-api/ ) }

  end#setup

  desc "Adiciona o Patrimonio" #########################
  task add_patrimonio: :environment do
  Patrimonio.create!(
    name: "5GBrasil",
    tag: 0
  )
  end

  desc "Adiciona Compartimento" #########################
  task add_compartimento: :environment do
    nomecompartimentos = %w(Recepção CPD)
    nomecompartimentos.each do |nomecompartimento|
      Compartimento.create!(
        name: nomecompartimento,
        patrimonio: Patrimonio.first
      )
    end  
  end

  desc "Adiciona Kindbtn" #########################
  task add_kindbtn: :environment do
    nameKindBtns = %w( time toggle toggle toggle pulso toggle toggle )
    nameKindBtns.each do |namekindbtn|
      Kindbtn.create!(
        name: namekindbtn
      )
    end 
  end
  
  desc "Adiciona Kinddev" #########################
  task add_kinddev: :environment do
    nameKinddevs = %w(fechadura-close lampada lampada lampada portao lampada sirene )
    nameKinddevs.each do |namekinddev|
      Kinddev.create!(
        name: namekinddev
      )
    end 
  end

  desc "Adiciona Circuits" #########################
  task add_circuit: :environment do
    7.times do |i|
      s = i+1
      Circuit.create!(
        sttus: 0,
        name: "Circuito#{s}",
        description: "1 fechadura para porta de vidro da recepcao", 
        compartimento: Compartimento.first,
        kindbtn: Kindbtn.find(s), 
        kinddev: Kinddev.find(s)
        # kinddev: Kinddev.first
      )
    end#times 
  end#task


  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")    
  end#show_spinner

end#dev
