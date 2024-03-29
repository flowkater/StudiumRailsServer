# Load RVM's capistrano plugin.    
require 'bundler/capistrano'

default_run_options[:pty] = true
set :application, "StudiumRailsServer"
set :repository,  "git@github.com:ChoJaewoo/StudiumRailsServer.git"

set :user, "root"
set :use_sudo, false
#set :scm_passphrase, "123123"

set :keep_releases, 5

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/#{application}"
set :normalize_asset_timestamps, false

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "14.63.222.63"                          # Your HTTP server, Apache/etc
role :app, "14.63.222.63"                          # This may be the same as your `Web` server
role :db,  "14.63.222.63", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

before "deploy:restart", "deploy:bundle_gems"
before "deploy:start", "deploy:db_migrate"

namespace :deploy do
  task :bundle_gems do
    run "cd #{deploy_to}/current && bundle" 
  end

  task :db_migrate do
    run "cd #{deploy_to}/current && rake db:migrate RAILS_ENV=production"
  end

  task :db_drop do
    run "cd #{deploy_to}/current && rake db:drop RAILS_ENV=production"
  end

  task :start, :roles => :app, :except => { :no_release => true} do
    run "cd #{deploy_to}/current && rake assets:precompile RAILS_ENV=production"
    run "cd #{deploy_to}/current && unicorn -c #{deploy_to}/current/config/unicorn.rb -D -E production"
  end

  task :stop, :roles => :app, :except => { :no_release => true} do
    run "if [ -f #{unicorn_pid} ]; then kill `cat #{unicorn_pid}`; fi" 
  end
  
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{unicorn_pid}`"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end