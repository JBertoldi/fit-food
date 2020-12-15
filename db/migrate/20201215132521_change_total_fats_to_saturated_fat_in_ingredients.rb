class ChangeTotalFatsToSaturatedFatInIngredients < ActiveRecord::Migration[6.0]
  def change
    rename_column :ingredients, :total_fats, :saturated_fat
  end
end
