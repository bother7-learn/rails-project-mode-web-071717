class AddUserTeamToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :user_team_id, :integer
  end
end
