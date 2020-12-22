class Recipe < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  belongs_to :user

  validates :name, format: { with: /\A([\p{L}0-9[-']])+(\s[\p{L}0-9[-']]+)*\Z/ }
  validates :name, length: { in: 5..50 }
  validates :instructions, length: { minimum: 10 }, allow_nil: true

  before_validation :format_details

  private

  def format_details
    self.name = name.strip
    self.instructions = instructions.strip unless instructions.nil?
  end
end
