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
    begin
      @helicopter = Helicopter.find(params[:id])
      
      @reservation = Reservation.where(helicopter_id: @helicopter.id)
      
      if @reservation.present?
        @reservation.destroy_all
      end
      @helicopter.destroy
      render json: { message: 'Helicopter successfully deleted...' }
      head :no_content
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: 'Helicopter not found' }, status: :not_found
    rescue StandardError => e
      render json: { error: 'An error occurred while deleting the helicopter' }, status: :internal_server_error
    end
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
