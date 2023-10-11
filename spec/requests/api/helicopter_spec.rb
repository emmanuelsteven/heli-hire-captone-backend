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
  end
  # Post Mehthod
  path '/api/helicopter/new' do
    post 'Creates a helicopter' do
      tags 'Helicopters'
      consumes 'application/json'
      parameter name: :helicopter, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          contact: { type: :string },
          price: { type: :number, format: :float },
          carriage_capacity: { type: :integer },
          image: { type: :string },
          model: { type: :string },
          description: { type: :string }
        },
        required: %w[name contact price carriage_capacity model]
      }

      response '200', 'helicopter created' do
        let(:helicopter) do
          {
            name: 'Sample Helicopter',
            contact: 'Contact Info',
            price: 100.0,
            carriage_capacity: 5,
            model: 'Model XYZ',
            description: 'A sample description'
          }
        end

        run_test!
      end

      response '422', 'invalid request' do
        let(:helicopter) { {} } # Provide invalid data to trigger a validation error

        run_test!
      end
    end
  end
  # Delete Method
  path '/api/helicopters/{id}' do
    delete 'Deletes a helicopter' do
      tags 'Helicopters'
      parameter name: :id, in: :path, type: :integer, description: 'ID of the helicopter to delete'

      response '200', 'helicopter deleted' do
        let(:id) { create(:helicopter).id }

        run_test!
      end

      response '404', 'helicopter not found' do
        let(:id) { 999 } # Provide a non-existing ID to trigger a 404 error

        run_test!
      end
    end
  end
end
