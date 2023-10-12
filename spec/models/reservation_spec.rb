# spec/models/reservation_spec.rb

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:helicopter_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:city) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:helicopter) }
  end

  # Additional integration tests can be added here
end
