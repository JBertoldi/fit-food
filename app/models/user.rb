class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes

  has_one_attached :photo

  validates :username, uniqueness: true
end
