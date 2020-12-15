class ChangeSaturatedFatsToTotalFatInIngredients < ActiveRecord::Migration[6.0]
  def change
    rename_column :ingredients, :saturated_fats, :total_fat
  end
end
