class ChangeTotalFatsToSaturatedFat < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :total_fats, :saturated_fat
  end
end
