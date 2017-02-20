require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should require a password' do
        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: 'email@email.email',
          password: nil,
          password_confirmation: 'password'
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should require a password confirmation' do
        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: 'email@email.email',
          password: 'password',
          password_confirmation: nil
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should require a first name' do
        @product = category.products.create({
          first_name: nil,
          last_name: 'Doe',
          email: 'email@email.email',
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should require a last name' do
        @product = category.products.create({
          first_name: 'John',
          last_name: nil,
          email: 'email@email.email',
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should require an email' do
        @product = category.products.create({
          first_name: 'John',
          last_name: nil,
          email: nil,
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should require passwords to be identical' do
        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: 'email@email.email',
          password: 'psswrd',
          password_confirmation: 'password'
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should require email to be unique' do
        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: 'a@a.a',
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@product.errors.full_messages).to include("Name can't be blank")
    end

  end
end
