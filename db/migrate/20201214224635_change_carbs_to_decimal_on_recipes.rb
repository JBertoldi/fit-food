class ChangeCarbsToDecimalOnRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :carbs, :decimal, precision: 10, scale: 5
  end
end
