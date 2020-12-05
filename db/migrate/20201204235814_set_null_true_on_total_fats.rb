class SetNullTrueOnTotalFats < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :total_fats, :true
  end
end
