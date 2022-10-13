# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

server '45.174.216.22', port: 22122, roles: [:web, :app, :db], primary: true

# set :default_stage, "staging"

set :repo_url,      'git@github.com:emersonml/davinci-api.git'
set :application,   'davinci-api'
set :user,          'deploy'
set :puma_threads,  [4, 16]
set :puma_workers,   4

 set :pty,             true
set :stages,        :production
ask :branch, 'dev'
set :deploy_to, "/var/www/#{fetch(:application)}"  # set :deploy_to, "/var/www/davinci-api"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
set :keep_releases, 5
# set :linked_dirs, %w{log uploads}
set :format, :airbrussh
set :puma_enable_socket_service, true 
set :log_level, :debug

append :linked_files, "config/database.yml", 'config/master.key'

append :linked_dirs, "storage", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"


# deployment process


namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/dev`
        puts "WARNING: HEAD is not the same as origin/dev"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Creating symlink for config file'
  task :config_symlink do
    puts "<<<<<<<ONDE ESTOU>>>>>>>1111111111111"
    on roles(:app) do
      puts "<<<<<<<ONDE ESTOU>>>>>>>222222222222222"
      sudo "ln -nfs #{release_path}/config/puma_init.sh /etc/init.d/puma_#{fetch(:application)}"
      puts "<<<<<<<ONDE ESTOU>>>>>>>333333333333"
      sudo "chmod +x /etc/init.d/puma_#{fetch(:application)}"
      execute "ln -nfs #{release_path}/config/puma.rb.example #{shared_path}/puma.rb"
      # execute "ln -sf #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      # execute "ln -sf #{shared_path}/config/secrets.yml #{release_path}/config/secrets.yml"
      # execute "ln -sf #{shared_path}/config/master.key #{release_path}/config/master.key"
      execute "ln -sf #{shared_path}/puma.rb #{release_path}/config/puma.rb"
    end
  end

  # desc 'Creating permissions and running db:seed'
  # task :populate_db do
  #   on roles(:app) do
  #     execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec rake permissions:create RAILS_ENV=#{fetch(:stage)}"
  #     execute "cd #{release_path} && ~/.rvm/bin/rvm default do bundle exec rake db:seed RAILS_ENV=#{fetch(:stage)}"
  #   end
  # end

  # after "deploy:migrating", :populate_db
  after  "symlink:linked_dirs",  :config_symlink
  before :starting,     :check_revision
  # after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
end







# after 'deploy:  ', 'deploy:restart'
# after 'deploy:finished', 'puma:restart'
  
#   namespace :puma do
#     task :restart do
#       invoke 'puma:restart'
#     end
#   end



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