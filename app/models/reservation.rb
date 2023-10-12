class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :helicopter
  validates :helicopter_id, :user_id, :date, :city, presence: true
  validates :helicopter_id, uniqueness: { scope: :date, message: 'Helicopter is already reserved for this date' }
end
