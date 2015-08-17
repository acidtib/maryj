class AddCategoryIdToStrain < ActiveRecord::Migration
  def change
    add_column :strains, :category_id, :integer
  end
end
