class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many:items
  has_one:rating
  validates :name, presence: true, length: { maximum: 25 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},uniqueness: { case_sensitive: false }
  
  def has_rating?
   !self.rating.nil?
  end
end
