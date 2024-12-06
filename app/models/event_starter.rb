class EventStarter < ApplicationRecord
  belongs_to :event
  belongs_to :starter
  belongs_to :event
  belongs_to :starter
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
