class ChangeSaltToDecimalOnRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :salt, :decimal, precision: 10, scale: 5
  end
end
