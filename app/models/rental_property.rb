class RentalProperty < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_many_attached :images
  belongs_to :user

  def self.filter_on_constraints(constraint_hash)
    records = RentalProperty.all
    operator_hash = {
        :bedrooms => '>=',
        :beds => '>=',
        :maxpersons => '>=',
        :bathrooms => '>=',
        :pets_allowed => '==',
        :price => '<=',
    }
    constraint_hash.each_pair do |key, value|
      symbol = key.to_sym
      operator = operator_hash[symbol]
      if !operator.nil?
        records = records.where("#{symbol.to_s} #{operator} ?", value)
      end
    end
    records
  end

  def distance_from(location)
    if location.nil?
      nil
    else
      self.distance_to(location)
    end
  end

end
