require 'rails_helper'

RSpec.describe Api::ReservationsController, type: :controller do
  let(:user) { create(:user) }
  let(:helicopter) { create(:helicopter) }

  describe 'GET #index' do
    it 'returns a list of reservations for a user' do
      create(:reservation, user:)

      get :index, params: { user_id: user.id }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).first['user_id']).to eq(user.id)
    end

    it 'returns an error for an invalid user' do
      get :index, params: { user_id: 'nonexistent' }

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'User not found')
    end
  end

  describe 'POST #create' do
    it 'creates a new reservation' do
      reservation_params = { helicopter_id: helicopter.id, date: Date.today, city: 'New York', status: 'pending' }

      post :create, params: { user_id: user.id, reservation: reservation_params }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['helicopter_id']).to eq(helicopter.id)
    end

    it 'returns an error if the reservation already exists' do
      create(:reservation, user:, helicopter:, date: Date.today)
      reservation_params = { helicopter_id: helicopter.id, date: Date.today, city: 'New York', status: 'pending' }

      post :create, params: { user_id: user.id, reservation: reservation_params }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include('error' => 'Reservation for this helicopter and date already exists')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a reservation' do
      reservation = create(:reservation, user:)

      delete :destroy, params: { id: reservation.id }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include('message' => 'Reservation deleted successfully!')
    end

    it 'returns an error if the reservation does not exist' do
      delete :destroy, params: { id: 'nonexistent' }

      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)).to include('error' => 'Failed to delete the reservation')
    end
  end
end
