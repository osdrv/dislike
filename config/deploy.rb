set :application, "dislike"
set :repository,  "git@github.com:4pcbr/dislike.git"
set :use_sudo, false
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_via, :remote_cache
set :branch, "master"

set :user, '4pcbr'

set :deploy_to, "/var/www/#{application}"

role :web, "4pcbr.com"                          # Your HTTP server, Apache/etc
role :app, "4pcbr.com"                          # This may be the same as your `Web` server
role :db,  "4pcbr.com", :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
