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
      redirect url(:biker, @biker)
    else
      redirect url(:controller => :login)
    end
  end
  
end
