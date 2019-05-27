class CreateDescrptions < ActiveRecord::Migration[5.2]
  def change
    create_table :descrptions do |t|
      t.string "name", null:false
      t.integer :rental_property_id
      t.timestamps
    end

  end
end
