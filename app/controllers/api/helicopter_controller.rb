class Api::HelicopterController < ApplicationController
    def index 
        @helicopters = Helicopter.all
        render json: @helicopters
    end
    def create
        @helicopters = Helicopter.new(helicopter_params)
    
        if @helicopter.save
          render json: @helicopter, status: 200
        else
          render json: {
            error: 'Error creating location...'
          }
        end
      end
    
      def location_params
        params.require(:location).permit(:name, :description, :contact, :price, :carriage_capacity, :model)
      end
end