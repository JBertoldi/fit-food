class Dose < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :amount, numericality: { greater_than: 0, message: 'Please enter a number greater than 0.' }
  validates :description, length: { maximum: 50, message: 'Please write a description with up to 50 characters' }
end
