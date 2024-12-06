class Dessert < ApplicationRecord
  has_many :event_desserts
  has_many :events, through: :event_desserts
end
