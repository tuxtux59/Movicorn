class AddRefIdToOmdbItems < ActiveRecord::Migration[5.2]
  def change
    add_column :omdb_items, :ref_id, :string
    OmdbItem.all.each{|i| i.update_ref_id}
  end
end
