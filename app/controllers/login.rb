class Login < Application
  
  def index
    if session[:uid]
      @biker = Biker[session[:uid]]
      redirect url(:biker, @biker)
    else
      render
    end
  rescue Exception => e
    render
  end
  
  def authenticate
    username, password = params[:username], params[:password]
    @biker = Biker.first(:username => username, :password => password)
    if @biker
      session[:uid] = @biker.id
      session[:user] = @biker.username
      redirect url(:biker, @biker)
    else
      redirect url(:controller => :login)
    end
  end
  
  def logout
    session[:uid] = session[:username] = nil
    redirect '/'
  end
  
end
