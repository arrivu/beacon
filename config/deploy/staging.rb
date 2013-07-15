server "192.168.1.85", :app, :web, :db, :primary => true
set :deploy_to, "/var/deploy/portal"
set :rails_env, "staging" 
set :scm_passphrase, ""
set :branch, "deploy"
set :port, 22