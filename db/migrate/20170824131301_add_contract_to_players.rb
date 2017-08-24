class AddContractToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :contract, :integer
  end
end
