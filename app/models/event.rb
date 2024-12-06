class Event < ApplicationRecord
  belongs_to :share
  validates :share, presence: true
  has_many :event_starters, dependent: :destroy
  has_many :starters, through: :event_starters

  accepts_nested_attributes_for :event_starters, allow_destroy: true
end
