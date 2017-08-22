class AddColumnNameToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :home_name, :string
    add_column :matches, :away_name, :string
  end
end
