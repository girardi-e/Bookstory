class Book < ApplicationRecord
  belongs_to :user
  validates :title, :author, :price, presence: true
  validates :description, length: { maximum: 200 }

  has_one_attached :photo
end
