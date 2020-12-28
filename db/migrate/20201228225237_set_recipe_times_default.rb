class SetRecipeTimesDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :recipes, :preparation_time, from: nil, to: 0
    change_column_default :recipes, :cooking_time, from: nil, to: 0
    change_column_default :recipes, :total_time, from: nil, to: 0
  end
end
