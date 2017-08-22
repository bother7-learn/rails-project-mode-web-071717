class AddPositionToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :position, :string
  end
end
