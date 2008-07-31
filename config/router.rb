# Merb::Router is the request routing mapper for the merb framework.
#
# You can route a specific URL to a controller / action pair:
#
#   r.match("/contact").
#     to(:controller => "info", :action => "contact")
#
# You can define placeholder parts of the url with the :symbol notation. These
# placeholders will be available in the params hash of your controllers. For example:
#
#   r.match("/books/:book_id/:action").
#     to(:controller => "books")
#   
# Or, use placeholders in the "to" results for more complicated routing, e.g.:
#
#   r.match("/admin/:module/:controller/:action/:id").
#     to(:controller => ":module/:controller")
#
# You can also use regular expressions, deferred routes, and many other options.
# See merb/specs/merb/router.rb for a fairly complete usage sample.

Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
  
  r.match( %r{^/bikers/(\d+)/(apr|may|jun|jul|aug|sep|oct|total)$} ).
    to( :controller => 'bikers', :action => 'show', :id => "[1]", :period => "[2]" )
    
  # RESTful routes
  r.resources :bikers do |biker|
    biker.resources :rides
  end
  
  r.resources :rides
  
  # AVAILABLE ROUTES

  #  :delete_ride
  #  :biker_rides
  #  :rides
  #  :new_biker
  #  :biker_ride
  #  :bikers
  #  :edit_biker
  #  :new_biker_ride
  #  :biker
  #  :ride
  #  :delete_biker
  #  :edit_biker_ride
  #  :new_ride
  #  :delete_biker_ride
  #  :edit_ride
   
  # This is the default route for /:controller/:action/:id
  # This is fine for most cases.  If you're heavily using resource-based
  # routes, you may want to comment/remove this line to prevent
  # clients from calling your create or destroy actions with a GET
  r.default_routes
  
  # Change this for your home page to be available at /
  r.match('/').to(:controller => 'login', :action =>'index')
end