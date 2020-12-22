class AddPreparationTimeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :preparation_time, :integer
  end
end
