class ChangeSaltToDecimalOnIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :salt, :decimal, precision: 10, scale: 5
  end
end
