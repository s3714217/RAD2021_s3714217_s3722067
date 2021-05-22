class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many:items
  has_one:rating
  validates :name, presence: true, length: { maximum: 25 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},uniqueness: { case_sensitive: false }
  
  def has_rating?
   !self.rating.nil?
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
