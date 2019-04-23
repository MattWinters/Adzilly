class CreateRentalProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_properties do |t|
      t.string :title
      t.text :description
      t.text :address
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :latitude, precision: 15, scale: 10, null: false
      t.decimal :longitude, precision: 15, scale: 10, null: false
      t.string :email
      t.string :industry
      t.integer :user, foreign_key: true

      t.timestamps
    end
  end
end
