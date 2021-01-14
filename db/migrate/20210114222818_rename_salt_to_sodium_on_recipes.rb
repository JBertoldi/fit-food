class RenameSaltToSodiumOnRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :salt, :sodium
  end
end
