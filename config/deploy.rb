set :application, "bike_contest"
set :repository,  "git@github.com:sbenhaim/bike_contest.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/selah/merb/#{application}"
set :db, "#{deploy_to}/db/#{application}.db"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "selah@atili.us"
role :web, "selah@atili.us"

# role :db,  "your db-server here", :primary => true

desc "Restart merb"
deploy.task :restart do
  run "merb -K all"
  run "merb -c 4 -m #{deploy_to}"
end

desc "Backup sqlite db"
task :backup_db do
  `scp selah@atili.us:#{deploy_to}/db/#{application}.db ~/Desktop/`
end

desc "Bikers information"
task :bikers do
  run "sqlite3 #{db} 'select * from bikers'"
end