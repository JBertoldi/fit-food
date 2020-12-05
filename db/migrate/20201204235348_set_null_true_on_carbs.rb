class SetNullTrueOnCarbs < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :carbs, :true
  end
end
