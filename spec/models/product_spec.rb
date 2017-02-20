require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      let(:category) { Category.create(name: 'test')}

      it 'should require a name' do
        @product = category.products.create({
          name: nil,
          description: 'Test testing',
          price: 10.99,
          quantity: 5
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should require a price' do
        @product = category.products.create({
          name: 'Tester',
          description: 'Test testing',
          price: nil,
          quantity: 5
          })
        expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it 'should require a quantity' do
        @product = category.products.create({
          name: 'Tester',
          description: 'Test testing',
          price: 10.99,
          quantity: nil
          })
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

     it 'should require a category' do
        @product = Product.create({
          name: 'Tester',
          description: 'Test testing',
          price: 10.99,
          quantity: 5
          })
        expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'should save' do
        @product = category.products.create({
          name: 'Tester',
          description: 'Test testing',
          price: 10.99,
          quantity: 10
          })
        expect(@product.id).to be_truthy
    end

  end
end