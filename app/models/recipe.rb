class Recipe < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  belongs_to :user

  validates :name, format: { with: /\A([a-zA-Z0-9[-']])+([\s][a-zA-Z0-9[-']]+)*\Z/, message: 'The name may only contain letters, numbers, apostrophes, hyphens and single spaces.' }
  validates :name, length: { in: 5..50, message: 'Please enter a name with a minimum of 5, and a maximum of 50 characters.' }
  validates :instructions, length: { minimum: 10, message: 'Please write instructions with a minimum of 10 characters.' }, allow_nil: true
  validates :user, presence: true
end
