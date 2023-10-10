require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do
      it 'is valid with valid name' do
        user = User.new(name: 'ronnie')
        expect(user).to be_valid
      end
  
      it 'is not valid without a name' do
        user = User.new(name: '')
        expect(user).not_to be_valid
      end
    end
  end