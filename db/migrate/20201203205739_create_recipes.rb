class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :instructions, null: false
      t.integer :kcal, null: false
      t.integer :carbs, null: false
      t.integer :saturated_fats, null: false
      t.integer :unsaturated_fats, null: false
      t.integer :protein, null: false
      t.float :salt, null: false

      t.timestamps
    end
  end
end
