class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  scope :recent, ->{order :name}
end
