class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :suggests, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :ratings, dependent: :destroy
  
  before_save {self.email = email.downcase}
  validates :name,  presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :tel, presence: true, numericality: true, length: {minimum: 6, maximum: 15}

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

  def is_user? user
    self == user
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
