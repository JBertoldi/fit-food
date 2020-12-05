class RenameUnsaturatedFatsInIngredients < ActiveRecord::Migration[6.0]
  def change
    rename_column :ingredients, :unsaturated_fats, :total_fats
  end
end
