require 'bundler/capistrano'
require 'capistrano/ext/multistage'

set :application, "Myapp"

set :scm, :git
set :repository, "git@github.com:m-narayan/beacon.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_passphrase, "deployadmin123$"

set :user, "sysadmin"
set :use_sudo, false

set :stages, ["staging", "production"]
set :default_stage, "staging"

default_run_options[:pty] = true
#ssh_options[:forward_agent] = true

#set :bundle_flags, "--quiet"

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
  end
  
  desc "Sync the public/assets directory."
  task :assets do
    system "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{application}:#{shared_path}/"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'