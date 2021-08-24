class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :date, :user, :book, presence: true
end
