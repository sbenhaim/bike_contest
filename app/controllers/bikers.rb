class Bikers < Application
  
  before :get_biker
  before :authenticate, :only => [:edit]
  before :adminstrator, :only => [:index, :new, :debug]
  
  def get_biker
    @biker = Biker.get(session[:uid])
  end
  
  def authenticate
    redirect "/" if !@biker || @biker.id != session[:uid]
  end
  
  def adminstrator
    redirect "/" if !@biker || @biker.username != 'sbenhaim'
  end

  def index
    @bikers = Biker.all
    render
  end

  def show
    @bikers = Biker.all
    @biker = Biker.get(params[:id])
    @user = Biker.get(session[:uid])
    @editable = @biker == @user
    @period = period_to_i( params[:period] )
    raise NotFound unless @biker
    render
  end

  def new
    only_provides :html
    @biker = Biker.new
    render
  end

  def edit
    only_provides :html
    raise NotFound unless @biker
    render :layout => false
  end

  def create
    @biker = Biker.new(params[:biker])
    if @biker.save
      redirect url(:biker, @biker)
    else
      render :new
    end
  end

  def update
    @biker = Biker.get(params[:id])
    raise NotFound unless @biker
    if @biker.update_attributes(params[:biker])
      redirect url(:biker, @biker)
    else
      raise BadRequest
    end
  end

  def delete
    @biker = Biker.get(params[:id])
    raise NotFound unless @biker
    if @biker.destroy
      redirect url(:biker)
    else
      raise BadRequest
    end
  end
  
  def debug_params
    display params
  end
  
  def unique
    provides :json
    column, value = params[:column], params[:value]
    return 'true' if column == 'username' && value == @biker.username
    Biker.all(column.to_sym => value).length == 0 ? 'true' : 'false'
  end

end
