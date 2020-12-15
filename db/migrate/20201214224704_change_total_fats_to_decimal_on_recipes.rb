class ChangeTotalFatsToDecimalOnRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :total_fats, :decimal, precision: 10, scale: 5
  end
end
