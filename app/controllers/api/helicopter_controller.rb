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
    @reservation.destroy_all
    @helicopter.destroy
    render json: { message: 'helicopter successfully deleted...' }
    head :no_content
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
