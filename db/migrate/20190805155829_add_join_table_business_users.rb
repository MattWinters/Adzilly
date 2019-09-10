class AddJoinTableBusinessUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses_users, id: false do |t|
      t.belongs_to :business
      t.belongs_to :user
    end
  end

    remove_column :businesses, :user_id
end
