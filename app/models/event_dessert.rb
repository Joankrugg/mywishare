class EventDessert < ApplicationRecord
  belongs_to :event
  belongs_to :dessert
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
