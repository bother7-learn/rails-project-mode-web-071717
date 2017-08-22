class PlayerUserTeam < ApplicationRecord
  belongs_to :user_team
  belongs_to :player
end
