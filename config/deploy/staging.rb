server "beacon.arrivu.corecloud.com", :app, :web, :db, :primary => true
set :deploy_to, "/var/capistrano/beacon/portal_staging"
set :rails_env, "staging" 
set :scm_passphrase, "deployadmin123$"
set :branch, "capistrano"