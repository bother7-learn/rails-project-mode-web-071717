class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :home_goals
      t.integer :away_goals
      t.string :final_log
      t.timestamps
    end
  end
end
