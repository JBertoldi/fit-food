class AddTotalTimeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :total_time, :integer
  end
end
