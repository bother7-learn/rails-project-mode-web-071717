class AddUserIdToUserTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :user_teams, :user_id, :integer
  end
end
