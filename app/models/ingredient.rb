class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { in: 3..50 }
  validates :kcal, numericality: { less_than_or_equal_to: 1_000 }
  validates :carbs, :total_fat, :saturated_fat, :protein, :salt, numericality: { less_than_or_equal_to: 100 }

  scope :ordered, -> { order(name: :asc) }
end
