server "online.example.in", :app, :web, :db, :primary => true
set :deploy_to, "/var/deploy/beacon/portal"
set :scm_passphrase, ""
set :branch, "deploy"