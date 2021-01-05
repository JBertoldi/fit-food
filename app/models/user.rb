class User < ApplicationRecord
  attr_writer :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :confirmable

  has_many :recipes, dependent: :destroy

  has_one_attached :photo

  validates :username, uniqueness: true

  # Igual à doc
  # validates :username, uniqueness: { case_sensitive: false }

  # Regex ligeiramente diferente do que eles propunham porque o deles não aceitava á, etc.
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

  # Igual à doc - mas também não consegui assim

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   elsif conditions.has_key?(:username) || conditions.has_key?(:email)
  #     where(conditions.to_h).first
  #   end
  # end
end
