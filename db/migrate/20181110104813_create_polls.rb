class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.references :user, foreign_key: true
      t.references :omdb_item, foreign_key: true
      t.integer :note, default: 1, inclusion: 1..5
      t.text :comment

      t.timestamps
    end
  end
end
