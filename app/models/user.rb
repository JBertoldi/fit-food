class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :confirmable

  has_many :recipes, dependent: :destroy

  has_one_attached :photo

  validates :username, uniqueness: true
end
