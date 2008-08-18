set :application, "bike_contest"
set :repository,  "git@github.com:sbenhaim/bike_contest.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/selah/merb/#{application}"
set :db, "#{shared_path}/db/#{application}.db"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "selah@atili.us"
role :web, "selah@atili.us"

# role :db,  "your db-server here", :primary => true



desc "Backup sqlite db"
task :backup_db do
  `scp selah@atili.us:#{shared_path}/db/#{application}.db ~/Desktop/`
end

desc "Bikers information"
task :bikers do
  run "sqlite3 #{db} 'select * from bikers'"
end


namespace :deploy do
  
  desc "Stop the application servers."
  task :stop do
    run "cd #{current_path}; merb -K all"
  end

  desc "Start the application servers."
  task :start do
    run "merb -c 4 -p 4000 -m #{current_path}"
  end
  
  desc "Restart merb"
  task :restart do
    stop
    start
  end
  
  task :after_default do
    run "mkdir -p #{current_path}/db"
    run "ln -nfs #{db} #{current_path}/db/bike_contest.db"
  end
  
end
