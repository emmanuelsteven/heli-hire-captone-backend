class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :helicopter

  # before_validation :set_reserved_date_end
  validates :helicopter_id, :user_id, :date, :city, presence: true
  validates :helicopter_id, uniqueness: { scope: :date, message: 'Helicopter is already reserved for this date' }

  # private

  # def set_reserved_date_end
  #   self.reserved_date_end ||= reserved_date_start # Set reserved_date_end to reserved_date_start if it's not provided
  # end
end
