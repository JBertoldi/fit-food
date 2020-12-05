class SetNullTrueOnProtein < ActiveRecord::Migration[6.0]
  def change
    change_column_null :recipes, :protein, :true
  end
end
