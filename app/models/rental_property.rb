class RentalProperty < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :user

  scope :rental_property_filter, -> (params){
    if params[:price].blank? && params[:industry].blank?
      all
    elsif params[:price].blank? && params[:industry].present?
      where('industry = ?', params[:industry])
    elsif params[:price].present? && params[:industry].blank?
      where('price >= ?', params[:price])
    else
      where('price >= ? AND industry = ?', params[:price], params[:industry])
    end
  }

end
