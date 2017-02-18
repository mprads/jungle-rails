class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :user, uniqueness: {scope: :product}

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :description, presence: true, length: { minimum: 1 }
  validates :rating, presence: true, inclusion: 1..5
end
