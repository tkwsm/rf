class User < ApplicationRecord

  validates :name, presence: true, length: { maximum: 50 }
  validates :role, presence: true, length: { maximum: 10 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end
