server "192.168.1.54", :app, :web, :db, :primary => true
set :deploy_to, "/var/deploy/beacon/portal"
set :rails_env, "staging" 
set :scm_passphrase, ""
set :branch, "deploy"
set :port, 22