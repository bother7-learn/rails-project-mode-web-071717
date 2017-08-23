class AddColumnToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :user_id, :integer
  end
end
