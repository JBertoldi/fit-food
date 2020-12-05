class SetNullTrueOnSalt < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :salt, :true
  end
end
