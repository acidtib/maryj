class CreateSymptomItems < ActiveRecord::Migration
  def change
    create_table :symptom_items do |t|
      t.integer :strain_id
      t.integer :symptom_id

      t.timestamps null: false
    end
  end
end
