class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, uniqueness: { case_sensitive: false, message: 'Ingredient already exists.' }
  validates :name, length: { in: 3..50, message: 'Please enter a name with a minimum of 3, and a maximum of 50 characters.' }
  validates :kcal, numericality: { only_integer: true, less_than_or_equal_to: 1_000, message: 'Please enter a decimal number up to 1000.' }
  validates :carbs, :total_fat, :saturated_fat, :protein, :salt, numericality: { only_integer: true, less_than_or_equal_to: 100, message: 'Please enter a decimal number up to 100.' }

  scope :ordered, -> { order(name: :asc) }
end
