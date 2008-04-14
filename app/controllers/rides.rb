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
    # @biker = Biker[params[:biker_id]]
    @ride = Ride.new :biker_id => params[:biker_id]
    render :layout => false
  end

  def edit
    only_provides :html
    @ride = Ride.first(params[:id])
    raise NotFound unless @ride
    render :layout => false
  end

  def create
    params[:ride][:date] = strtodate(params[:ride][:date])
    params[:ride][:biker_id] = params[:biker_id]
    @ride = Ride.new(params[:ride])
    if @ride.save
      redirect url(:biker, Biker[params[:biker_id]])
    else
      render :new
    end
  end

  def update
    @ride = Ride.first(params[:id])
    params[:ride][:date] = strtodate(params[:ride][:date])
    biker = @ride.biker
    raise NotFound unless @ride
    if @ride.update_attributes(params[:ride])
      redirect url(:biker, biker)
    else
      raise BadRequest
    end
  end

  def delete
    @ride = Ride.first(params[:id])
    biker = @ride.biker
    raise NotFound unless @ride
    if @ride.destroy!
      redirect url(:biker, biker)
    else
      raise BadRequest
    end
  end
  
  def show_date_guess
    render pretty_date(strtodate(params[:date])), :layout => false
  end

end
