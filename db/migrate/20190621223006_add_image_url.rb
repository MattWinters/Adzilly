class AddImageUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :rental_properties, :image_url, :string
  end
end
