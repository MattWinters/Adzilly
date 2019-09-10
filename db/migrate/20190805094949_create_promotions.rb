class CreatePromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :promotions do |t|
      t.string :promotion_type

      t.timestamps
    end

    create_table :businesses_promotions, id: false do |t|
      t.belongs_to :business
      t.belongs_to :promotion
    end
  end
end
