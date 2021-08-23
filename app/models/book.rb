class Book < ApplicationRecord
  belongs_to :user
  validates :title, :author, :price, presence: true
end
