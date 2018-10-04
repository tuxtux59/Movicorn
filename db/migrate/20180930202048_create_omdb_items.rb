class CreateOmdbItems < ActiveRecord::Migration[5.2]
  def change
    create_table :omdb_items do |t|
      t.string :title
      t.date :released_date
      t.string :released
      t.interval :runtime
      t.string :locale
      t.string :country
      t.string :type

      t.timestamps
    end
  end
end
