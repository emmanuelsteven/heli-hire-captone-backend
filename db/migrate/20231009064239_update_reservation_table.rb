class UpdateReservationTable < ActiveRecord::Migration[7.0]
  def change
    # rename :reserved_date_start to :date on reservations table
    rename_column :reservations, :reserved_date_start, :date
    # remove :reserved_date_end from reservations table
    remove_column :reservations, :reserved_date_end
  end
end
