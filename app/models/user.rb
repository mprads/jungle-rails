class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 1 }
  validates :password_confirmation, presence: true, length: { minimum: 5 }
end
