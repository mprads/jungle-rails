require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      let(:category) { Category.create(name: 'test')}

      it 'Should require a description' do
        @product = category.products.create({
          name: 'Tester',
          description: nil,
          price: 10.99,
          quantity: 5
          })
        expect(@product.id).to_be nil
    end

    it 'Should require a price' do
        @product = category.products.create({
          name: 'Tester',
          description: 'Test testing',
          price: nil,
          quantity: 5
          })
        expect(@product.id).to_be nil
    end

    it 'Should require a name' do
        @product = category.products.create({
          name: nil,
          description: 'Test testing',
          price: 10.99,
          quantity: 5
          })
        expect(@product.id).to_be nil
    end

    it 'Should require a name' do
        @product = category.products.create({
          name: nil,
          description: 'Test testing',
          price: 10.99,
          quantity: 5
          })
        expect(@product.id).to_be nil
    end
  end
end