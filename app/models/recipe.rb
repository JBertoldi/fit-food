class Recipe < ApplicationRecord
  searchkick word_middle: %i[name ingredients_name]

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :favourites, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  validates :name, format: { with: /\A([\p{L}0-9[-']])+(\s[\p{L}0-9[-']]+)*\Z/ }
  validates :name, length: { in: 4..50 }
  validates :instructions, length: { minimum: 10 }, allow_nil: true
  validates :preparation_time, :cooking_time, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  before_validation :format_details
  before_save :calc_total_time

  scope :ordered, -> { order(name: :asc) }
  scope :published, -> { where(published: true) }
  scope :favourited_by, ->(username) { joins(:favourites).where(favourites: { user: User.where(username: username) }) }

  def publish
    !published && publishable? ? publish! : false
  end

  private

  def search_data
    attributes.merge(
      name: name,
      ingredients_name: ingredients.map(&:name)
    )
  end

  def format_details
    self.name = name.strip
    self.instructions = instructions.strip unless instructions.nil?
  end

  def calc_total_time
    self.total_time = preparation_time + cooking_time
  end

  def publishable?
    attributes.each do |attr|
      return false if attr[1].nil?
    end
  end

  def publish!
    self.published = true
    save
  end
end
