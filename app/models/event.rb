class Event < ApplicationRecord

  validate :date_must_be_valid

  belongs_to :share
  validates :share, presence: true
  has_many :event_starters, dependent: :destroy
  has_many :starters, through: :event_starters
  accepts_nested_attributes_for :event_starters, allow_destroy: true
  has_many :event_desserts, dependent: :destroy
  has_many :desserts, through: :event_desserts
  accepts_nested_attributes_for :event_desserts, allow_destroy: true
  belongs_to :organizer
  accepts_nested_attributes_for :organizer

  private

  def date_must_be_valid
    unless EventsHelper.new.available_dates(0, 3).include?(date)
      errors.add(:date, "n'est pas une date valide")
    end
  end
end




