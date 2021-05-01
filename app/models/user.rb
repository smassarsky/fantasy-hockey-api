class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :password, :email, :name
  validates_uniqueness_of :username, :email

  has_many :owned_matchups, class_name: "Matchup", foreign_key: "owner_id"

  has_many :user_matchups
  has_many :matchups, through: :user_matchups
  has_many :picks, through: :user_matchups
  
end