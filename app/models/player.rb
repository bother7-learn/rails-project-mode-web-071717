class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :player_user_teams
  has_many :user_teams, through: :player_user_teams
  delegate :league, to: :team

  validates :name, presence: true
  validates :shooting,:passing,:defense,:foul,:dribbling, presence: true
  # validates :user_team_id, absence: true
end
