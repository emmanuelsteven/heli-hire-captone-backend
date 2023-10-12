class Api::HelicopterController < ApplicationController
  def index
    @helicopters = Helicopter.all
    render json: @helicopters
  end

  def show
    @helicopter = Helicopter.find(params[:id])
    render json: @helicopter
  end

  def create
    @helicopter = Helicopter.new(helicopter_params)

    if @helicopter.save
      render json: @helicopter, status: 200
    else
      render json: {
        error: 'Error creating service...'
      }
    end
  end

  def destroy
    @helicopter = Helicopter.find(params[:id])

    @reservation = Reservation.where(helicopter_id: @helicopter.id)

    @reservation.destroy_all if @reservation.present?
    @helicopter.destroy
    render json: { message: 'Helicopter successfully deleted...' }
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Helicopter not found' }, status: :not_found
  rescue StandardError
    render json: { error: 'An error occurred while deleting the helicopter' }, status: :internal_server_error
  end

  private

  def helicopter_params
    params.require(:helicopter).permit(
      :name,
      :contact,
      :price,
      :carriage_capacity,
      :image,
      :model,
      :description
    )
  end
end
