require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should require a name' do
        @product = category.products.create({
          first_name: 'Test',
          last_name: 'Test',
          email: '',
          password: 10.99,
          password_confirmation: 5
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end
end
