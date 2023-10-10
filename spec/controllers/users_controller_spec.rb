require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe 'POST #register' do
    it 'creates a new user' do
      post :register, params: { name: 'ronnie' }
      expect(response).to have_http_status(:created)
      expect(User.find_by(name: 'ronnie')).not_to be_nil
    end

    it 'returns unprocessable entity status if user is not saved' do
      post :register, params: { name: '' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to include("Name can't be blank")
    end
  end

  describe 'GET #login' do
    it 'returns the user if found' do
      user = User.create(name: 'ronnie')
      get :login, params: { name: 'ronnie' }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['name']).to eq('ronnie')
    end

    it 'returns not found if user is not found' do
      get :login, params: { name: 'Nonexistent User' }
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('User not found')
    end
  end
end
