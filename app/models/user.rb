class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 1 }
  validates :password_confirmation, presence: true, length: { minimum: 5 }


  def self.authenticate_with_credentials(email, password)
    user = User.where(('email=?').downcase, email.strip.downcase).first
      if user && user.authenticate(password)
        user
      else
        nil
      end
  end
end
