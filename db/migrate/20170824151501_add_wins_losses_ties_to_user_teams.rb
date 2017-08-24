class AddWinsLossesTiesToUserTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :user_teams, :wins, :integer, :default => 0
    add_column :user_teams, :losses, :integer, :default => 0
    add_column :user_teams, :ties, :integer, :default => 0
  end
end
