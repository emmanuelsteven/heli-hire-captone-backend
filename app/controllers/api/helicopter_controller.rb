class Api::HelicopterController < ApplicationController
  def index
    @helicopters = Helicopter.all
    render json: @helicopters
  end

  def create
    @helicopter = Helicopter.new(helicopter_params)

    if @helicopter.save
      render json: @helicopter, status: 200
    else
      render json: {
        error: 'Error creating location...'
      }
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

