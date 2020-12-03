class Recipe < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy

  validates :name, format: { with: /\A([a-zA-Z0-9])+([\s][a-zA-Z0-9]+)*\Z/, message: "The recipe's name may only contain letters, numbers and single spaces." }
  validates :name, length: { in: 5..50, message: 'Please enter a name with a minimum of 5, and a maximum of 50 characters.' }
  validates :preparation, length: { minimum: 10, message: 'Please write instructions with a minimum of 10 characters.' }
end
