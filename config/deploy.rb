set :application, "ezteam"
set :deploy_user, "ezteam"

set :scm, :git
set :repo_url, 'git@github.com:rugbycub/EZTeam.git'

set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set(:config_files, %w(
  nginx.conf
  application.yml
  database.example.yml
  log_rotation
  monit
  unicorn.rb
  unicorn_init.sh
))

set(:executable_config_files, %w(
  unicorn_init.sh
))


set(:symlinks, [
  {
    source: "nginx.conf",
    link: "/etc/nginx/sites-enabled/#{fetch(:full_app_name)}"
  },
  {
    source: "unicorn_init.sh",
    link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
  },
  {
    source: "log_rotation",
   link: "/etc/logrotate.d/#{fetch(:full_app_name)}"
  },
  {
    source: "monit",
    link: "/etc/monit/conf.d/#{fetch(:full_app_name)}.conf"
  }
])



# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do
  
  
  
  
  # compile assets locally then rsync
  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'
end
namespace :figaro do
  desc "SCP transfer figaro configuration to the shared folder"
  task :setup do
    transfer :up, "config/application.yml", "#{shared_path}/application.yml", via: :scp
  end
 
  desc "Symlink application.yml to the release path"
  task :symlink do
    run "ln -sf #{shared_path}/application.yml #{latest_release}/config/application.yml"
  end
 
  desc "Check if figaro configuration file exists on the server"
  task :check do
    begin
      run "test -f #{shared_path}/application.yml"
    rescue Capistrano::CommandError
      unless fetch(:force, false)
        logger.important 'application.yml file does not exist on the server "shared/application.yml"'
        exit
      end
    end
  end
end
after "deploy:setup", "figaro:setup"
after "deploy:create_symlink", "figaro:symlink"
