class DropDescribtionTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :descrptions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
