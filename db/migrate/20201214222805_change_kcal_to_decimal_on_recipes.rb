class ChangeKcalToDecimalOnRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :kcal, :decimal, precision: 10, scale: 5
  end
end
