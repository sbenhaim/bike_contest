class Bikers < Application
  # provides :xml, :yaml, :js

  def index
    @bikers = Biker.all
    render
  end

  def show
    @biker = Biker.first(params[:id])
    @bikers = Biker.all
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
    @biker = Biker.first(params[:id])
    raise NotFound unless @biker
    render
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
    @biker = Biker.find(params[:id])
    raise NotFound unless @biker
    if @biker.update_attributes(params[:biker])
      redirect url(:biker, @biker)
    else
      raise BadRequest
    end
  end

  def delete
    @biker = Biker.first(params[:id])
    raise NotFound unless @biker
    if @biker.destroy!
      redirect url(:biker)
    else
      raise BadRequest
    end
  end
  
  def debug_params
    display params
  end

end
