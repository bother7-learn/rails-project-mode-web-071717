class AddUserTeamsToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :hometeam_id, :integer
    add_column :matches, :awayteam_id, :integer
  end
end
