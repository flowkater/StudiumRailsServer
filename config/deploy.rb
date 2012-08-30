require 'bundler/capistrano'

set :application, "StudiumRailsServer" # Your application location on your server goes here

default_run_options[:pty] = true

set :repository,  "git@github.com:ChoJaewoo/StudiumRailsServer.git"
set :scm, :none
set :deploy_via, :copy

set :checkout, 'export'

set :user, 'kater102' # Your username goes here
set :use_sudo, false
# set :domain, 'tweetni.com' # Your domain goes here
set :applicationdir, "/home/#{user}/#{application}"
set :deploy_to, applicationdir

role :web, application                
role :app, application                          
role :db,  application, :primary => true 
set :port, 2222


set :chmod755, "app config db lib public vendor script script/* public/disp*"

namespace :deploy do
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
end