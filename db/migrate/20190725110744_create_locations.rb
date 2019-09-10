class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :image_location
      t.string :information_of_location
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
