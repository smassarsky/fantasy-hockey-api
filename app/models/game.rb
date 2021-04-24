class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players

  has_many :game_teams
  has_many :teams, through: :game_teams

  has_many :goals
  has_many :assists, through: :goals

  def home_team=(team)
    self.game_teams.build(team: team, home_away: 'home')
  end

  def away_team=(team)
    self.game_teams.build(team: team, home_away: 'away')
  end

  def home_team
    self.game_teams.find_by(home_away: 'home').team
  end

  def away_team
    self.game_teams.find_by(home_away: 'away').team
  end
  
end