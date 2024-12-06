class Organizer < ApplicationRecord
  has_many :events, dependent: :destroy
  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end

