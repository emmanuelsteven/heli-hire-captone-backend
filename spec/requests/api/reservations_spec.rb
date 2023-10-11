require 'swagger_helper'

describe 'Reservations API' do
  path '/api/reservations' do
    get 'Retrieves a list of reservations' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'reservations found' do
        run_test!
      end
    end

    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          helicopter_id: { type: :integer },
          city: { type: :string },
          reserved_date_start: { type: :string, format: :date },
          reserved_date_end: { type: :string, format: :date }
        },
        required: %w[user_id helicopter_id city reserved_date_start reserved_date_end]
      }

      response '201', 'reservation created' do
        let(:reservation) do
          {
            user_id: create(:user).id,
            helicopter_id: create(:helicopter).id,
            city: 'Sample City',
            reserved_date_start: '2023-10-15',
            reserved_date_end: '2023-10-16'
          }
        end

        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { {} } # Provide invalid data to trigger a validation error

        run_test!
      end
    end
  end

  path '/api/reservations/{id}' do
    delete 'Deletes a reservation' do
      tags 'Reservations'
      parameter name: :id, in: :path, type: :integer, description: 'ID of the reservation to delete'

      response '200', 'reservation deleted' do
        let(:id) { create(:reservation).id }

        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 999 } # Provide a non-existing ID to trigger a 404 error

        run_test!
      end
    end
  end
end
