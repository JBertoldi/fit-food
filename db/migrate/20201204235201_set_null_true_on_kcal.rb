class SetNullTrueOnKcal < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :kcal, :true
  end
end
