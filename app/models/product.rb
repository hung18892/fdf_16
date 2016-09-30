class Product < ApplicationRecord
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :carts_details, dependent: :destroy
  has_many :carts, through: :carts_details
end
