class User < ApplicationRecord
  attr_writer :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :confirmable

  has_many :recipes, dependent: :destroy

  has_one_attached :photo

  validates :username, uniqueness: true
  validates :username, format: { with: /\A[[:alpha:]]*\z/ }

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['username = :value OR email = :value', { value: login }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
