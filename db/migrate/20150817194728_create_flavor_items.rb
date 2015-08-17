class CreateFlavorItems < ActiveRecord::Migration
  def change
    create_table :flavor_items do |t|
      t.integer :strain_id
      t.integer :flavor_id

      t.timestamps null: false
    end
  end
end
