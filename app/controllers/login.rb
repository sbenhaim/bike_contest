class Login < Application
  
  def index
    render
  end
  
  def authenticate
    username, password = params[:username], params[:password]
    @biker = Biker.first(:username => username, :password => password)
    if @biker
      redirect url(:biker, @biker)
    else
      redirect url(:controller => :login)
    end
  end
  
end
