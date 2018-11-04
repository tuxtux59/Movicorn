class ChangeReleaseToBeDateInOmdbItems < ActiveRecord::Migration[5.2]
  def change
    OmdbItem.where(released: 'N/A').update_all(released: nil)
    change_column :omdb_items, :released, 'date USING released::date'
  end
end
