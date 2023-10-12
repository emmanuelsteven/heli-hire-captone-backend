require 'rails_helper'

RSpec.describe Api::HelicopterController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a JSON response' do
      get :index
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    # Add more tests for the index action as needed.
  end

  describe 'POST #create' do
    let(:valid_params) do
      {
        helicopter: {
          name: 'Sample Helicopter',
          contact: 'Contact Info',
          price: 100.0,
          carriage_capacity: 5,
          model: 'Model XYZ',
          description: 'A sample description'
        }
      }
    end

    it 'creates a new helicopter' do
      expect do
        post :create, params: valid_params
      end.to change(Helicopter, :count).by(1)
    end

    it 'returns a success response' do
      post :create, params: valid_params
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON response' do
      post :create, params: valid_params
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns the created helicopter' do
      post :create, params: valid_params
      expect(response.body).to include('Sample Helicopter')
    end
  end
end
