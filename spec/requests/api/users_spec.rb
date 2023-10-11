require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/api/users' do
    post('new_session user') do
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }

        },
        required: ['name']
      }

      response '201', 'user created' do
        let(:user) { { name: 'Ali' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'Ali' } }

        before do
          User.create(name: 'Ali')
        end

        run_test!
      end
    end
  end
end