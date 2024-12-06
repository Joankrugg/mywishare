class Starter < ApplicationRecord
  has_many :event_starters
  has_many :events, through: :event_starters
end
