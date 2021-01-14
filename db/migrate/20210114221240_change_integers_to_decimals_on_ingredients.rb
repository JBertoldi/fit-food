class ChangeIntegersToDecimalsOnIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :kcal, :decimal, precision: 5, scale: 2, null: false
    change_column :ingredients, :carbs, :decimal, precision: 5, scale: 2, null: false
    change_column :ingredients, :total_fat, :decimal, precision: 5, scale: 2, null: false
    change_column :ingredients, :saturated_fat, :decimal, precision: 5, scale: 2, null: false
    change_column :ingredients, :protein, :decimal, precision: 5, scale: 2, null: false
  end
end
