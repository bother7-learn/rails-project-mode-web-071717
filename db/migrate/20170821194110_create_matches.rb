class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :hometeam_id
      t.integer :awayteam_id

      t.timestamps
    end
  end
end
