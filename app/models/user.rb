class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :suggests, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :ratings, dependent: :destroy
end
