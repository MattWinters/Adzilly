class AddColumnsToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :age_range_from, :integer
    add_column :businesses, :age_range_to, :integer
    add_column :businesses, :male, :float
    add_column :businesses, :female, :float
  end
end
