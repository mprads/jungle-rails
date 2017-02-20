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
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should require a password confirmation' do
        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: 'email@email.email',
          password: 'password',
          password_confirmation: nil
          })
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should require a first name' do
        @user = User.create({
          first_name: nil,
          last_name: 'Doe',
          email: 'email@email.email',
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should require a last name' do
        @user = User.create({
          first_name: 'John',
          last_name: nil,
          email: 'email@email.email',
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should require an email' do
        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: nil,
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should require passwords to be identical' do
        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: 'email@email.email',
          password: 'psswrd',
          password_confirmation: 'password'
          })
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should require email to be unique' do
        @conflictor = User.create({
           first_name: 'Jon',
          last_name: 'Do',
          email: 'a@a.a',
          password: 'psswrd',
          password_confirmation: 'psswrd'
          })

        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: 'a@a.a',
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it 'should require a password' do
        @user = User.create({
          first_name: 'John',
          last_name: 'Doe',
          email: 'email@email.email',
          password: 'password',
          password_confirmation: 'password'
          })
        expect(@user.id).to be_truthy
    end
  end
end
