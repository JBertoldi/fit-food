class AddDefaultValuesToRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :recipes, :kcal, 0
    change_column_default :recipes, :carbs, 0
    change_column_default :recipes, :total_fat, 0
    change_column_default :recipes, :saturated_fat, 0
    change_column_default :recipes, :protein, 0
    change_column_default :recipes, :salt, 0
  end
end
