class Ingredient < ApplicationRecord
  # searchkick

  has_many :doses

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { in: 3..50 }
  validates :kcal, numericality: { less_than_or_equal_to: 1_000 }
  validates :carbs, :total_fat, :saturated_fat, :protein, numericality: { less_than_or_equal_to: 100 }
  validates :sodium, numericality: { less_than_or_equal_to: 5_000 }

  scope :ordered, -> { order(name: :asc) }
end
