class RenameUnsaturatedFatsInRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :unsaturated_fats, :total_fats
  end
end
