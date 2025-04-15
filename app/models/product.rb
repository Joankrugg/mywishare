class Product < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :description, presence: true
  belongs_to :category
end
