class UserTeam < ApplicationRecord
  has_many :player_user_teams
  has_many :players, through: :player_user_teams
  belongs_to :user, optional: true

  # validates :player_id, unqueness: true


end
