class UserTeam < ApplicationRecord
  has_many :player_user_teams
  has_many :players, through: :player_user_teams
  belongs_to :user, optional: true
  has_many :matches, foreign_key: "hometeam_id"
  has_many :matches, foreign_key: "awayteam_id"
  # validates :player_id, unqueness: true


end
