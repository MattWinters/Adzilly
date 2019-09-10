class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    create_table :businesses_tags do |t|
      t.belongs_to :business
      t.belongs_to :tag
    end
  end
end
