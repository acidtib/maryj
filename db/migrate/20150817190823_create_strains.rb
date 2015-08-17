class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :slug
      t.string :name
      t.string :symbol
      t.text :description

      t.timestamps null: false
    end
  end
end
