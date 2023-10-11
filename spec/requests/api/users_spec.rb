require 'swagger_helper'

describe 'Users API' do
  path '/api/users/register' do
    post 'Registers a new user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :name, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'user registered' do
        let(:name) { 'NewUser' } # Provide a unique name

        run_test!
      end

      response '422', 'invalid request' do
        let(:name) { '' } # Provide an empty name to trigger a validation error

        run_test!
      end
    end
  end

  path '/api/users/login' do
    post 'Logs in an existing user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :name, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'user logged in' do
        let(:name) { create(:user).name } # Provide an existing user's name

        run_test!
      end

      response '404', 'user not found' do
        let(:name) { 'NonExistentUser' } # Provide a non-existing user's name

        run_test!
      end
    end
  end
end
