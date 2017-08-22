class CreatePlayerUserTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :player_user_teams do |t|
      t.integer :user_team_id
      t.integer :player_id
    end
  end
end
