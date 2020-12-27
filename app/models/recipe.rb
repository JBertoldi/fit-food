class Recipe < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  validates :name, format: { with: /\A([\p{L}0-9[-']])+(\s[\p{L}0-9[-']]+)*\Z/ }
  validates :name, length: { in: 4..50 }
  validates :instructions, length: { minimum: 10 }, allow_nil: true
  validates :difficulty, :photo, presence: true

  before_validation :format_details
  before_save :calc_total_time

  private

  def format_details
    self.name = name.strip
    self.instructions = instructions.strip unless instructions.nil?
  end

  def calc_total_time
    self.total_time = preparation_time + cooking_time unless preparation_time.nil? || cooking_time.nil?
  end
end
