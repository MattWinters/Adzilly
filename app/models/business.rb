class Business < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true, :reject_if => :all_blank
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :promotions
  has_and_belongs_to_many :users

  paginates_per 6
  scope :business_filter, -> (params, business_ids) {
    where(
      "id IN (#{business_ids.present? ? business_ids.join(',') : 'NULL'})"
    ).price_industry_filter(params).order_by(params, business_ids).page(params[:page])
  }

  scope :price_industry_filter, -> (params){
    if params[:price].blank? && params[:industry].present?
      where('industry = ?', params[:industry])
    elsif params[:price].present? && params[:industry].blank?
      where('price <= ?', params[:price])
    elsif params[:price].present? && params[:industry].present?
      where('price <= ? AND industry = ?', params[:price], params[:industry])
    end
  }

  scope :order_by, -> (params, business_ids){
    if params[:order_by].blank? || params[:order_by] == "distance"
      order(Arel.sql(business_ids.map{|x| "id = #{x} desc"}.join(", ")))
    else
      order(Arel.sql("#{params[:order_by]} #{params[:order_to]}"))
    end
  }

end
