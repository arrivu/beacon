require 'bundler/capistrano'
require 'capistrano/ext/multistage'

set :application, "Myapp"

set :scm, :git
set :repository, "git@github.com:m-narayan/beacon.git"
set :branch, "capistrano"
set :deploy_via, :remote_cache
set :scm_passphrase, "deployadmin123$"

set :user, "sysadmin"
set :use_sudo, false

set :stages, ["staging", "production"]
set :default_stage, "staging"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

#set :bundle_flags, "--quiet"

namespace :deploy do
  task :start do; end
  task :stop do; end
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end

after 'deploy:update_code', 'deploy:migrate'
