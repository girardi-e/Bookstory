class Book < ApplicationRecord
  validates :title, :author, :price, presence: true
end
