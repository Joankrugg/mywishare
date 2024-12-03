class Share < ApplicationRecord
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :events, dependent: :destroy
end
