class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :player_user_teams
  belongs_to :user, optional: true
  has_many :user_teams, through: :player_user_teams
  delegate :league, to: :team, allow_nil: true

  validates :name, presence: true
  validates :shooting,:passing,:defense,:foul,:dribbling, presence: true
end
