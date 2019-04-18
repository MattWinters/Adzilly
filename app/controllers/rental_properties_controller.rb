class RentalPropertiesController < ApplicationController
  def index
    update_session
    @location = get_location
    @properties = RentalProperty.all
    filter
    order = params[:order] || :distance
    if order.to_sym != :distance
        @properties = @properties.order(order)
    else
        @properties = @properties.near(@location, 10000)
    end
  end

  def show
    @location = get_location
    @property = RentalProperty.find(params[:id])
  end

  def new
    @propety = RentalProperty.new
  end

  def create
    p = RentalProperty.new(create_update_params) # "mass assignment" of attributes!
    begin
    if p.save
      flash[:notice] = "New rental property, #{p.title}, successfully created"
      redirect_to rental_properties_path and return
    end
    rescue ActiveRecord::NotNullViolation
      flash[:warning] = "Property can't be created without an address"
      redirect_to new_rental_property_path
    end
  end

  def edit
    @property = RentalProperty.find(params[:id])
  end

  def update
    @property = RentalProperty.find(params[:id])
    @property.update(create_update_params)
    flash[:notice] = "#{@property.title} was successfully updated."
    redirect_to rental_property_path(@property)
  end

  def destroy
    @property = RentalProperty.find(params[:id])
    @property.destroy
    flash[:notice] = "Rental property listing, #{@property.title} was removed"
    redirect_to rental_properties_path
  end

private
  def update_session
    filterParams = [:bathrooms, :price, :maxpersons, :miles, :filter_location, :filter, :clear]
    if params[:filter]
      session[:price] = params[:price]
      session[:miles] = params[:miles]
      session[:filter_location] = params[:filter_location]
      @price = session[:price]
      @miles = session[:miles]
      @filter_location = session[:filter_location]
    end
    if params[:clear]
      session.clear
    end
  end

  private
    def filter
      if session[:industry] && session[:industry] != ""
        @properties = @properties.where("industry >= ?", session[:industry])
      end
      if session[:price] && session[:price] != ""
        @properties = @properties.where("price <= ?", session[:price])
      end
      if session[:maxpersons] && session[:maxpersons] != ""
        @properties = @properties.where("maxpersons >= ?", session[:maxpersons])
      end
      if session[:miles] && session[:miles] != ""
        if session[:filter_location] && session[:filter_location] != ""
          @properties = @properties.near(session[:filter_location], session[:miles])
        else
          @properties = @properties.near(@location, session[:miles])
        end
      end
    end

private
  def get_location
    loc = request.location
    logger.debug("location #{loc.latitude} #{loc.longitude}")
    if loc.latitude.nil? || loc.longitude.nil?
      return [43.6307863, -74.4659275]
    else
      return [loc.latitude, loc.longitude]
    end
  end

private
  def create_update_params
    params.require(:rental_property).permit(:title, :description, :bedrooms, :beds, :maxpersons, :bathrooms, :pets_allowed, :address, :price, :user_id, :images)
  end

end
