class Rides < Application
  # provides :xml, :yaml, :js

  def index
    @rides = Ride.all
    display @rides
  end

  def show
    @ride = Ride.first(params[:id])
    raise NotFound unless @ride
    display @ride
  end

  def new
    only_provides :html
    @biker = Biker[params[:biker_id]]
    @ride = Ride.new
    render
  end

  def edit
    only_provides :html
    @ride = Ride.first(params[:id])
    raise NotFound unless @ride
    render
  end

  def create
    params[:ride][:date] = `php -r 'echo date("Y-m-d", strtotime("#{params[:ride][:date]}"));'`.chomp
    @ride = Ride.new(params[:ride])
    if @ride.save
      redirect url(:controller => :bikers, :action => :show, :id => params[:ride][:biker_id])
    else
      render :new
    end
  end

  def update
    @ride = Ride.first(params[:id])
    raise NotFound unless @ride
    if @ride.update_attributes(params[:ride])
      redirect url(:ride, @ride)
    else
      raise BadRequest
    end
  end

  def destroy
    @ride = Ride.first(params[:id])
    raise NotFound unless @ride
    if @ride.destroy!
      redirect url(:ride)
    else
      raise BadRequest
    end
  end

end
