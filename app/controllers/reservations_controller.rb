class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.create(reservation_params)
    if @reservation.valid?
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.permit(:user_id, :helicopter_id, :city, :reserved_date_start, :reserved_date_end)
  end
end
