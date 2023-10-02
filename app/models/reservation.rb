class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :helicopter

  before_validation :set_reserved_date_end

  private

  def set_reserved_date_end
    self.reserved_date_end ||= reserved_date_start # Set reserved_date_end to reserved_date_start if it's not provided
  end
end
