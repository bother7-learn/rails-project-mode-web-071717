class AddWinsLossesTiesToUserTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :user_teams, :wins, :integer
    add_column :user_teams, :losses, :integer
    add_column :user_teams, :ties, :integer
  end
end
