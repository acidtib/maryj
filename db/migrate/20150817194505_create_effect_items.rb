class CreateEffectItems < ActiveRecord::Migration
  def change
    create_table :effect_items do |t|
      t.integer :strain_id
      t.integer :effect_id

      t.timestamps null: false
    end
  end
end
