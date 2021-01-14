class RenameSaltToSodiumOnIngredients < ActiveRecord::Migration[6.0]
  def change
    rename_column :ingredients, :salt, :sodium
  end
end
