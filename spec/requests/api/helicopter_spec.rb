require 'swagger_helper'

RSpec.describe 'api/helicopter', type: :request do
  path '/api/helicopter' do
    get 'Get all Helicopters' do
      tags 'Helicopters'
      produces 'application/json'
      response '200', 'Helicopter found' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :text },
                   contact: { type: :string },
                   price: { type: :decimal },
                   carriage_capacity: { type: :decimal },
                   model: { type: :integer },
                   image: { type: :string }
                 },
                 required: %w[id name description contact price carriage_capacity model image]
               }

        run_test! do
          # Create some sample services for testing
          Helicopter.create!(name: 'Helicopter 1', description: 'This is an example', contact: '123533', price: 12_345, carriage_capacity: 12,
                             model: 122, image: 'image.jpg')
          Helicopter.create(name: 'Helicopter 2', description: 'This is an example2', contact: '1235332', price: 123, carriage_capacity: 1,
                            model: 123, image: 'image.jpg')

          # Make a request to retrieve all services
          get '/api/helicopter'

          # Assert the response status code
          expect(response).to have_http_status(:ok)

          # Assert the response body against the defined schema
          helicopters = JSON.parse(response.body)
          expect(helicopters).to be_an(Array)
          expect(helicopters.length).to eq(2)
          expect(helicopters[0]).to include('id', 'name', 'description', 'contact', 'price', 'carriage_capacity',
                                            'model', 'image')
        end
      end
    end  
    post 'Create a helicopter' do
      tags 'Helicopters'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :helicopter, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          description: { type: :text },
          contact: { type: :string },
          price: { type: :decimal },
          carriage_capacity: { type: :decimal },
          model: { type: :integer },
          image: { type: :string }
        },
        required: %w[id name description contact price carriage_capacity model image]
      }

      response '200', 'Helicopter created' do
        schema type: :object,
               properties: {
                id: { type: :integer },
                name: { type: :string },
                description: { type: :text },
                contact: { type: :string },
                price: { type: :decimal },
                carriage_capacity: { type: :decimal },
                model: { type: :integer },
                image: { type: :string }
               },
               required: %w[id name description contact price carriage_capacity model image]

        let(:helicopter) do
          {
            name: 'New Service',
            description: 'Hello World',
            contact: '32424',
            price: 1234,
            carriage_capacity: 23,
            model: 12345,
            image: 'image.jpg'
          }
        end

        run_test! do
          # Make a request to create a service
          post '/api/helicopter', params: { helicopter: }

          # Assert the response status code
          expect(response).to have_http_status(:ok)

          # Assert the response body against the defined schema
          created_helicopter = JSON.parse(response.body)
          expect(created_helicopter).to include('id', 'name', 'description', 'contact', 'price', 'carriage_capacity', 'model', 'image')
        end
      end

      response '200', 'Error creating helicopter' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']

        let(:helicopter) { { name: 'Invalid helicopter', price: 'invalid' } }

        run_test! do
          # Make a request to create a service with invalid data
          post '/api/helicopter', params: { helicopter: }

          # Assert the response status code
          expect(response).to have_http_status(:ok)

          # Assert the response body against the defined schema
          error_response = JSON.parse(response.body)
          expect(error_response).to include('error')
        end
      end
    end
  end
  path '/api/helicopter/{id}' do
    parameter name: :id, in: :path, type: :integer, required: true

    get 'Retrieve a Helicopter' do
      tags 'Helicopters'
      produces 'application/json'
      response '200', 'Helicopter found' do
        schema type: :object,
               properties: {
                id: { type: :integer },
                name: { type: :string },
                description: { type: :text },
                contact: { type: :string },
                price: { type: :decimal },
                carriage_capacity: { type: :decimal },
                model: { type: :integer },
                image: { type: :string }
               },
               required: %w[id name description contact price carriage_capacity model image]

        let(:id) do
          Helicopter.create(name: 'Helicopter 4', description: 'This is an example2', contact: '1235332', price: 123, carriage_capacity: 1,
            model: 123, image: 'image.jpg').id
        end

        run_test! do
          # Make a request to retrieve a service
          get "/api/helicopter/#{id}"

          # Assert the response status code
          expect(response).to have_http_status(:ok)

          # Assert the response body against the defined schema
          service = JSON.parse(response.body)
          expect(service).to include('id', 'name', 'description', 'contact', 'price', 'carriage_capacity', 'model', 'image')
        end
      end

      response '404', 'Helicopter not found' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']

        let(:id) { 999 }

        run_test! do
          # Make a request to retrieve a non-existing service
          get "/api/helicopter/#{id}"

          # Assert the response status code
          expect(response).to have_http_status(:not_found)

          # Assert the response body against the defined schema
          error_response = JSON.parse(response.body)
          expect(error_response).to include('error')
        end
      end
    end

    delete 'Delete a helicopter' do
      tags 'Helicopters'
      produces 'application/json'
      response '204', 'Helicopter deleted' do
        let(:id) do
          Helicopter.create(name: 'Helicopter 4', description: 'This is an example2', contact: '1235332', price: 123, carriage_capacity: 1,
            model: 123, image: 'image.jpg').id
        end

        run_test! do
          # Make a request to delete a service
          delete "/api/helicopter#{id}"

          # Assert the response status code
          expect(response).to have_http_status(:no_content)

          # Assert that the service is deleted
          expect(Helicopter.find_by(id:)).to be_nil
        end
      end

      response '404', 'Helicopter not found' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']

        let(:id) { 999 }

        run_test! do
          # Make a request to delete a non-existing service
          delete "/api/helicopter/#{id}"

          # Assert the response status code
          expect(response).to have_http_status(:not_found)

          # Assert the response body against the defined schema
          error_response = JSON.parse(response.body)
          expect(error_response).to include('error')
        end
      end
    end
  end
end


