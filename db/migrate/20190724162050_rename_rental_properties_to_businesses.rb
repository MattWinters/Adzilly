class RenameRentalPropertiesToBusinesses < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :rental_properties, :businesses
  end

  def self.down
    rename_table :rental_properties, :businesses
  end
end
