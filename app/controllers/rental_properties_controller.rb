class RentalPropertiesController < ApplicationController

  before_action :set_rental_property, only: [
    :show,
    :edit,
    :update,
    :destroy
  ]

  before_action :set_location, only: [
    :show,
    :index
  ]

  def index
    @rental_properties = RentalProperty.rental_property_filter(params)
    @indusries_for_selest = INDUSTRIES_FOR_SELECT

    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @indusries_for_selest = INDUSTRIES_FOR_SELECT
    @rental_property = RentalProperty.new
  end

  def create
    @rental_propertyset_rental_property = current_user.rental_properties.new(rental_property_params)
    respond_to do |format|
      if @rental_property.save
        format.js {render :created}
      else
        format.js {render :created_error}
      end
    end
  end

  def show; end

  def edit
    respond_to do |format|
      format.js {render :edited}
    end
  end

  def update
      @rental_property.update(rental_property_params)
      respond_to do |format|
        format.js {render :updated}
    end
  end

  def destroy
    respond_to do |format|
      if @rental_property.destroy
        format.js {render :destroyed}
      else
        format.js {render :destroyed_error}
      end
    end
  end

  private

  def set_location
    @location = get_location
  end

  def set_rental_property
    @rental_property = RentalProperty.find(params[:id])
  end

  def get_location
    loc = request.location
    logger.debug("location #{loc.latitude} #{loc.longitude}")
    if loc.latitude.nil? || loc.longitude.nil?
      return [43.6307863, -74.4659275]
    else
      return [loc.latitude, loc.longitude]
    end
  end

  def rental_property_params
    params.require(:rental_property).permit(:title, :description, :address, :price, :user_id, :email, :industry) #email?
  end
end
