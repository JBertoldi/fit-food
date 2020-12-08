class ChangeColumnNullOnInstructions < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :instructions, true
  end
end
