class Book < ApplicationRecord
  belongs_to :user
  validates :title, :author, :price, presence: true

  has_one_attached :photo
end
