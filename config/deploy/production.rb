#astrano production config
#
# config/deploy/production.rb


server "14.63.222.63:80",                :app, :web, :db, :primary => true
set :branch,                     "production"
set :deploy_to,                  "/home/app/public_html/app_production"
set :rails_env,                  "production"
