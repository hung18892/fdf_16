class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :recent, ->{order created_at: :desc}
  
  validates :content, presence: true, length: {maximum: 200}
end
