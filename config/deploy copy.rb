# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

server '45.174.216.22', port: 22122, roles: [:web, :app, :db], primary: true

# set :default_stage, "staging"

set :repo_url,      'git@github.com:emersonml/davinci-api.git'
set :application,   'davinci-api'
set :user,          'deploy'
set :puma_threads,  [4, 16]
set :puma_workers,   4

# set :stages, %w(production staging)
set :stages,        :production
# set :default_stage, "production"
# Default branch is :main
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
ask :branch, 'dev'
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/davinci-api"

# Default value for :format is :airbrussh.
set :format, :airbrussh

###  A ativação do soquete do Systemd inicia seu aplicativo na primeira solicitação, se ainda não estiver em execução
set :puma_enable_socket_service, true 


###  se estiver implantando em um host no qual não possui sudo ou privilégios de root e precisa restringir o caminho.
# set :puma_user, fetch(:user)
# set :puma_role, :web
# set :puma_service_unit_env_files, []
# set :puma_service_unit_env_vars, []



set :log_level, :debug

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, "storage", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

#### set :user = 'deploy'

set :ssh_options, {
  forward_agent: true,
  ### or    
  ### :keys => [File.join(ENV["HOME"], ".ssh", "decwise")],
  port: 22122
  }

# deployment process

# after 'deploy:  ', 'deploy:restart'
after 'deploy:finished', 'puma:restart'
  
  namespace :puma do
    task :restart do
      invoke 'puma:restart'
    end
  end



# # after "deploy:update", "passenger:setup_symlinks"
# after "deploy:finished", "passenger:setup_symlinks"

# # tasks

# namespace :passenger do
#   desc "Creates a symlink for the database.yml file"
#   task :setup_symlinks, :roles => :app do
#     puts "\n\n=== Setting up symbolic links ===\n\n"
#     run "ln -s #{deploy_to}/#{shared_dir}/config/database.yml #{current_path}/config/database.yml"
#   end
# end

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

######################################################################################


  ######################################################################################


  # namespace :puma do
  #   namespace :systemd do
  #     desc 'Reload the puma service via systemd by sending USR1 (e.g. trigger a zero downtime deploy)'
  #     task :reload do
  #       on roles(fetch(:puma_role)) do
  #         if fetch(:puma_systemctl_user) == :system
  #           sudo "#{fetch(:puma_systemctl_bin)} reload-or-restart #{fetch(:puma_service_unit_name)}"
  #         else
  #           execute "#{fetch(:puma_systemctl_bin)}", "--user", "reload", fetch(:puma_service_unit_name)
  #           execute :loginctl, "enable-linger", fetch(:puma_lingering_user) if fetch(:puma_enable_lingering)
  #         end
  #       end
  #     end
  #   end
  # end
  
  # after 'deploy:finished', 'puma:systemd:reload'