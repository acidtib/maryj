class CreateConditionItems < ActiveRecord::Migration
  def change
    create_table :condition_items do |t|
      t.integer :strain_id
      t.integer :condition_id

      t.timestamps null: false
    end
  end
end
