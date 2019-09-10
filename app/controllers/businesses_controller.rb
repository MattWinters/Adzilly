class BusinessesController < ApplicationController

  before_action :set_business, only: [
    :show,
    :edit,
    :update,
    :destroy
  ]

  before_action :set_location_for_business, only: [
    :show,
    :index
  ]

  before_action :set_type_device, only: :show

  def index
    set_businesses
    @indusries_for_selest = INDUSTRIES_FOR_SELECT
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @indusries_for_selest = INDUSTRIES_FOR_SELECT
    @business = Business.new
    @business.locations.build
  end

  def create
    @business = current_user.businesses.new(business_params)
    respond_to do |format|
      if @business.save
        format.js {render :created}
      else
        format.js {render :created_error}
      end
    end
  end

  def show; end

  def edit
    @indusries_for_selest = INDUSTRIES_FOR_SELECT
  end

  def update
      @business.update(business_params)
      respond_to do |format|
        format.js {render :updated}
    end
  end

  def destroy
    respond_to do |format|
      if @business.destroy
        format.js {render :destroyed}
      else
        format.js {render :destroyed_error}
      end
    end
  end

  private

  def set_location_for_business
    @location_business = get_location
  end

  def set_business
    @business = Business.find(params[:id])
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

  def set_businesses
    @businesses = Business.business_filter(
      params,
      Location.filter_location(params, @location_business).map{|l| l.business_id}
    )
  end

  def business_params
    params.require(:business).permit(
      :title,
      :description,
      :price,
      :address,
      :user_id,
      :email,
      :industry,
      :male,
      :female,
      :age_range_from,
      :age_range_to,
      locations_attributes: [
        :id,
        :_destroy,
        :business_id,
        :description,
        :address,
        :image
      ]
    )
  end
end
