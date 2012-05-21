require 'bundler/capistrano'
set :application, "massiveapp"
set :scm, :git
set :repository, "git@github.com:ahatch1490/massiveapp.git"
server "localhost", :web, :app, :db, :primarey => true
ssh_options[:port] = 2222
ssh_options[:keys] = "/Library/Ruby/Gems/1.8/gems/vagrant-1.0.3/keys/vagrant"
set :user , "vagrant"
set :group, "vagrant"
set :deploy_to, "/var/massiveapp"
set :use_sudo, false
set :deploy_via, "copy"
set :copy_strategy, :export

namespace :deploy do

	task :start do ; end
	task :stop do ; end
	desc "Restart the application"
	task :restart, :roles => :app, :except => {:no_release => true} do
		run "#{try_sudo} touch#{File.join(current_path,'tmp','restart.txt')}"
	
		puts ":finsished running /n"
	end
	
	
	desc "Copy the database.yml file to the latest release"	
	
	task :copy_in_database_yml do
		run "cp #{shared_path}/config/database.yml #{latest_release}/config/"
	end
end






