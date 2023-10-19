require 'rails_helper'
require 'swagger_helper'


describe 'Reservations API' do
  path '/api/users/1/reservations' do
    get 'Retrieves all reservations' do
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
          date: { type: :datetime }
        },
        required: %w[user_id helicopter_id city date]
      }

      response '201', 'reservation created' do
        let(:reservation) { { user_id: 1, helicopter_id: 1, city: "new yourk", date: '2023-10-10'} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) {  { user_id: 1, helicopter_id: 1, city: "new yourk", date: '2023-10-10'}}
        run_test!
      end
    end
  end
end