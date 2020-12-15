class ChangeSaturatedFatsToDecimalOnRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :saturated_fats, :decimal, precision: 10, scale: 5
  end
end
