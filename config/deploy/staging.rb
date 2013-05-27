server "beacon.arrivu.corecloud.com", :app, :web, :db, :primary => true
set :deploy_to, "/var/capistrano/beacon/portal_staging"
