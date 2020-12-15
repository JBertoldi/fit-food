class ChangeSaturatedFatsToTotalFat < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :saturated_fats, :total_fat
  end
end
