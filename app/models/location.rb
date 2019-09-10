class Location < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode

  belongs_to :business

  scope :filter_location, -> (params, user_location){
    near(
      params[:location].present? ? params[:location] : user_location,
      params[:miles].present? ? params[:miles] : 25000
    )
  }

end
