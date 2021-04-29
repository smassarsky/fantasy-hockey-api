class UserMatchup < ApplicationRecord
  belongs_to :matchup
  has_one :owner, through: :matchup
  belongs_to :user
  has_many :picks
  has_many :players, through: :picks

end