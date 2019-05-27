class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :comment
      t.integer :user_id
      t.integer :rental_property_id
      t.timestamps
    end
  end
end
