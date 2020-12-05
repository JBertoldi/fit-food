class RemoveNullFalseOnRecipeKcal < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :kcal, :integer
  end
end
