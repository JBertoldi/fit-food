class ChangeAmountToDecimalOnDoses < ActiveRecord::Migration[6.0]
  def change
    change_column :doses, :amount, :decimal, precision: 10, scale: 5
  end
end
