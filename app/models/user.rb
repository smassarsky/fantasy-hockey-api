class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :password, :email, :name
  validates_uniqueness_of :username, :email

  
end