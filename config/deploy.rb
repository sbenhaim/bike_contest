set :application, "bike_contest"
set :repository,  "git@github.com:sbenhaim/bike_contest.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/selah/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "selah@atili.us"
role :web, "selah@atili.us"

# role :db,  "your db-server here", :primary => true