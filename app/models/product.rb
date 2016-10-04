class Product < ApplicationRecord
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :carts_details, dependent: :destroy
  has_many :carts, through: :carts_details
  validate  :picture_size
  validates :name, presence: true
  validates :price, presence: true
  validates :species, presence: true

  mount_uploader :picture, PictureUploader
  scope :recent, ->{order created_at: :desc}

  private
  def picture_size
    if picture.size > Settings.size_image.megabytes
      errors.add(:picture, t(:picture_notice))
    end
  end
end
