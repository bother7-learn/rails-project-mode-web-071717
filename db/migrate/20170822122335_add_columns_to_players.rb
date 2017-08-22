class AddColumnsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :shooting, :integer
    add_column :players, :passing, :integer
    add_column :players, :defense, :integer
    add_column :players, :foul, :integer
    add_column :players, :dribbling, :integer
  end
end
