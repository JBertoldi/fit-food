class SetNullTrueOnSaturatedFats < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :saturated_fats, :true
  end
end
