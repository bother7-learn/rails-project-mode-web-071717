class AddColumnsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :shooting, :integer, :default => 0
    add_column :players, :passing, :integer, :default => 0
    add_column :players, :defense, :integer, :default => 0
    add_column :players, :foul, :integer, :default => 0
    add_column :players, :dribbling, :integer, :default => 0
  end
end
