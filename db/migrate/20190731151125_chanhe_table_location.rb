class ChanheTableLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :image_location
    rename_column :locations, :information_of_location, :description
    add_attachment :locations, :image
  end
end
