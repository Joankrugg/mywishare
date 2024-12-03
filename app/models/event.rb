class Event < ApplicationRecord
  belongs_to :share
  validates :share, presence: true
end
