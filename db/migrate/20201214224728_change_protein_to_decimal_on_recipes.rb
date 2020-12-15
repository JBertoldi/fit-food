class ChangeProteinToDecimalOnRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :protein, :decimal, precision: 10, scale: 5
  end
end
