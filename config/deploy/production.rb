server "beaconlaerning.com", :app, :web, :db, :primary => true
set :deploy_to, "/var/capistrano/beacon/portal"
set :scm_passphrase, "deployadmin123$"
set :branch, "production"