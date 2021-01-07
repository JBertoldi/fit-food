class AddFavouritesCountToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :favourites_count, :integer, default: 0
  end
end
